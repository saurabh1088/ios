//
//  DigitImageRenderer.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 28/02/25.
//

import Foundation
import SwiftUI

/// A utility struct for rendering drawing strokes into a 28x28 grayscale `UIImage` suitable for MNIST digit
/// recognition models.
/// This struct takes an array of strokes (points from a drawing canvas) and converts them into an image format
/// expected by MNIST models, featuring white digits on a black background, scaled to 28x28 pixels.
struct DigitImageRenderer {
    /// Generates a 28x28 UIImage from an array of strokes, suitable for MNIST model input.
    /// - Parameter strokes: Array of stroke points (e.g., from a drawing view), where each stroke is an array of CGPoints.
    /// - Parameter canvasSize: Size of the original drawing canvas (default 300x300).
    /// - Returns: A UIImage with white digits on a black background, scaled to 28x28.
    static func saveAsImage(strokes: [[CGPoint]], canvasSize: CGSize = CGSize(width: 300, height: 300)) -> UIImage {
        /// MNIST models expect a 28x28 pixel grayscale image.
        let targetSize = CGSize(width: 28, height: 28)
        
        // Create an image renderer for the target size
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        // Render the image using the provided context
        return renderer.image { context in
            // Black background (MNIST standard: white digits on black)
            UIColor.black.setFill()
            context.fill(CGRect(origin: .zero, size: targetSize))
            
            // Calculate scaling factors to map points from the canvas size to 28x28
            let scaleX = targetSize.width / canvasSize.width
            let scaleY = targetSize.height / canvasSize.height
            
            // Create a path to draw the strokes
            let path = UIBezierPath()
            path.lineWidth = 2 // Line width optimized for 28x28 scale
            UIColor.white.setStroke() // White strokes for MNIST compatibility
            
            for stroke in strokes {
                if let first = stroke.first {
                    // Move to the first point of the stroke, scaled to 28x28
                    path.move(to: CGPoint(x: first.x * scaleX, y: first.y * scaleY))
                    // Draw lines to subsequent points in the stroke
                    for point in stroke.dropFirst() {
                        path.addLine(to: CGPoint(x: point.x * scaleX, y: point.y * scaleY))
                    }
                }
            }
            // Stroke the path to render the drawing
            path.stroke()
        }
    }
}
