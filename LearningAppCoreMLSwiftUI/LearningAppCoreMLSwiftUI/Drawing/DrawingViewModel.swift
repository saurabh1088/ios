//
//  DrawingViewModel.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 27/02/25.
//

import Foundation
import CoreML
import Vision
import UIKit

class DrawingViewModel: ObservableObject {
    /// Stores all the strokes on view
    @Published var strokes: [[CGPoint]] = [[]]
    @Published var recognizedDigit: String = "?"
    
    func addPoint(_ point: CGPoint) {
        strokes[strokes.count - 1].append(point)
        objectWillChange.send()
    }
    
    func startNewStroke() {
        strokes.append([])
    }
    
    func clear() {
        strokes = [[]]
    }
    
    func recognizeDigit(from image: UIImage) {
        do {
            let model = try VNCoreMLModel(for: MNISTClassifier(configuration: MLModelConfiguration()).model)
            
            let request = VNCoreMLRequest(model: model) { request, _ in
                if let results = request.results as? [VNClassificationObservation],
                   let topResult = results.first {
                    DispatchQueue.main.async { [weak self] in
                        self?.recognizedDigit = topResult.identifier // Extract the predicted digit
                        print("Recognized Digit: \(topResult.identifier), Confidence: \(topResult.confidence)")
                    }
                } else {
                    print("No valid results found")
                }
            }

            guard let buffer = ImageProcessor().convertToPixelBuffer(image: image) else {
                print("Failed to convert image to PixelBuffer")
                return
            }

            let handler = VNImageRequestHandler(cvPixelBuffer: buffer)

            try handler.perform([request])
        } catch {
            print("Error loading MNISTClassifier model: \(error)")
        }
    }
}
