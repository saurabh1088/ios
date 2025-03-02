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

/// A view model that manages the state and logic for a drawing interface, including stroke storage and digit recognition.
/// This class is designed to work with a SwiftUI view like `DrawingView`, handling user-drawn strokes and
/// using a machine learning model (MNISTClassifier) to recognize digits from drawings.
/// 
/// The DrawingViewModel class is a view model designed for a SwiftUI drawing app. It manages the state of
/// user-drawn strokes and supports digit recognition using a machine learning model (MNISTClassifier).
/// The class conforms to ObservableObject to enable SwiftUI views to react to changes in its published properties.
class DrawingViewModel: ObservableObject {
    // MARK: - Properties
    
    /// Stores all the strokes on view
    /// An array of strokes, where each stroke is an array of points (`[CGPoint]`).
    /// The outer array represents all strokes, and each inner array represents the points of a single stroke.
    /// Initialized with one empty stroke to ensure there's always a stroke to append points to.
    @Published var strokes: [[CGPoint]] = [[]]
    
    /// The recognized digit from the drawing, updated after performing digit recognition.
    /// Defaults to "?" until a digit is recognized.
    /// Also is set to "?" when user clears all strokes on `DrawingView`
    @Published var recognizedDigit: String = "?"
    
    // MARK: - Methods
        
    /// Adds a point to the current stroke and notifies observers of the change.
    /// - Parameter point: The `CGPoint` to append to the current stroke.
    /// - Note: The point is added to the last stroke in the `strokes` array.
    func addPoint(_ point: CGPoint) {
        strokes[strokes.count - 1].append(point)
        objectWillChange.send()
    }
    
    /// Starts a new stroke by appending an empty array to the `strokes` array.
    /// This allows subsequent points to be added to a new stroke, separating it from previous strokes.
    func startNewStroke() {
        strokes.append([])
    }
    
    /// Clears the canvas by resetting the `strokes` array to contain a single empty stroke.
    /// This effectively removes all drawn strokes while ensuring a new stroke can be started.
    func clear() {
        strokes = [[]]
    }
    
    /// Recognizes a digit from a given `UIImage` using the MNISTClassifier model.
    /// MNISTClassifier model from https://developer.apple.com/machine-learning/models/?q=mnis
    /// The image is converted to a `CVPixelBuffer` and processed by the model to predict a digit.
    /// The result is stored in `recognizedDigit`.
    /// - Parameter image: The `UIImage` containing the drawing to analyze.
    /// - Note: This method relies on an `ImageProcessor` struct with a `convertToPixelBuffer` method to preprocess the image.
    func recognizeDigit(from image: UIImage) {
        do {
            // Load the MNISTClassifier model
            let model = try VNCoreMLModel(for: MNISTClassifier(configuration: MLModelConfiguration()).model)
            
            // Create a Vision request to perform digit recognition
            let request = VNCoreMLRequest(model: model) { request, _ in
                // Process the results of the recognition
                if let results = request.results as? [VNClassificationObservation],
                   let topResult = results.first {
                    DispatchQueue.main.async { [weak self] in
                        // Update the recognized digit on the main thread
                        self?.recognizedDigit = topResult.identifier // Extract the predicted digit
                        print("Recognized Digit: \(topResult.identifier), Confidence: \(topResult.confidence)")
                    }
                } else {
                    print("No valid results found")
                }
            }

            // Convert the image to a pixel buffer using ImageProcessor
            guard let buffer = ImageProcessor().convertToPixelBuffer(image: image) else {
                print("Failed to convert image to PixelBuffer")
                return
            }

            // Perform the Vision request with the pixel buffer
            let handler = VNImageRequestHandler(cvPixelBuffer: buffer)

            try handler.perform([request])
        } catch {
            print("Error loading MNISTClassifier model: \(error)")
        }
    }
}
