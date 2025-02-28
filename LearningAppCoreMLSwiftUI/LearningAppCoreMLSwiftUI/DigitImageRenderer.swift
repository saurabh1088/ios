//
//  DigitImageRenderer.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 28/02/25.
//

import Foundation
import SwiftUI

struct DigitImageRenderer {
    /// Generates a 28x28 UIImage from an array of strokes, suitable for MNIST model input.
    /// - Parameter strokes: Array of stroke points (e.g., from a drawing view), where each stroke is an array of CGPoints.
    /// - Parameter canvasSize: Size of the original drawing canvas (default 300x300).
    /// - Returns: A UIImage with white digits on a black background, scaled to 28x28.
    static func saveAsImage(strokes: [[CGPoint]], canvasSize: CGSize = CGSize(width: 300, height: 300)) -> UIImage {
        /// MNIST models expect a 28x28 pixel grayscale image.
        let targetSize = CGSize(width: 28, height: 28)
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { context in
            // Black background (MNIST standard: white digits on black)
            UIColor.black.setFill()
            context.fill(CGRect(origin: .zero, size: targetSize))
            
            // Scale points from canvasSize to 28x28
            let scaleX = targetSize.width / canvasSize.width
            let scaleY = targetSize.height / canvasSize.height
            
            let path = UIBezierPath()
            path.lineWidth = 2 // Suitable for 28x28 scale
            UIColor.white.setStroke()
            
            for stroke in strokes {
                if let first = stroke.first {
                    path.move(to: CGPoint(x: first.x * scaleX, y: first.y * scaleY))
                    for point in stroke.dropFirst() {
                        path.addLine(to: CGPoint(x: point.x * scaleX, y: point.y * scaleY))
                    }
                }
            }
            path.stroke()
        }
    }
}
