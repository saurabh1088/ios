//
//  RedactionViewModel.swift
//  LogRedactor
//
//  Created by Saurabh Verma on 12/02/26.
//

import Foundation
import Combine
import UIKit
import SwiftUI
import PhotosUI

@MainActor
final class RedactionViewModel: ObservableObject {

    @Published var originalImage: UIImage?
    @Published var redactionBlocks: [RedactionBlock] = []

    private let ocrService = OCRService()
    private let nerService = NERService()

    func loadImage(from item: PhotosPickerItem?) async {
        guard let data = try? await item?.loadTransferable(type: Data.self),
              let image = UIImage(data: data) else { return }

        self.originalImage = image

        await process(image: image)
    }

    private func process(image: UIImage) async {
        let observations = await ocrService.extractText(from: image)

        var blocks: [RedactionBlock] = []

        for observation in observations {
            let detectedRanges = nerService.detectPII(in: observation.text)

            for range in detectedRanges {
                if let rect = observation.boundingBox(for: range,
                                                      imageSize: image.size) {
                    blocks.append(RedactionBlock(rect: rect))
                }
            }
        }

        self.redactionBlocks = blocks
    }
}

