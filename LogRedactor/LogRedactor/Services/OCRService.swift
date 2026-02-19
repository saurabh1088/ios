//
//  OCRService.swift
//  LogRedactor
//
//  Created by Saurabh Verma on 12/02/26.
//

import Vision
import UIKit

struct OCRObservation {
    let text: String
    let observation: VNRecognizedTextObservation
}

final class OCRService {

    func extractText(from image: UIImage) async -> [OCRObservation] {

        guard let cgImage = image.cgImage else { return [] }

        return await withCheckedContinuation { continuation in
            let request = VNRecognizeTextRequest { request, _ in
                guard let results = request.results as? [VNRecognizedTextObservation] else {
                    continuation.resume(returning: [])
                    return
                }

                let observations = results.compactMap { observation -> OCRObservation? in
                    guard let candidate = observation.topCandidates(1).first else { return nil }
                    return OCRObservation(text: candidate.string,
                                          observation: observation)
                }

                continuation.resume(returning: observations)
            }

            request.recognitionLevel = .accurate

            let handler = VNImageRequestHandler(cgImage: cgImage)
            try? handler.perform([request])
        }
    }
}

extension OCRObservation {

    func boundingBox(for range: Range<String.Index>,
                     imageSize: CGSize) -> CGRect? {

        guard let candidate = observation.topCandidates(1).first else { return nil }

        guard let box = try? candidate.boundingBox(for: range) else { return nil }

        let rect = VNImageRectForNormalizedRect(box.boundingBox,
                                                Int(imageSize.width),
                                                Int(imageSize.height))

        return rect
    }
}
