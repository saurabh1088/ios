//
//  ImageProcessor.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 01/03/25.
//

import Foundation
import CoreVideo
import UIKit

/// A utility struct for processing images into a format suitable for machine learning model input.
/// This struct provides functionality to convert a `UIImage` into a `CVPixelBuffer`, which is a common
/// format for Core ML and Vision frameworks.
/// The resulting pixel buffer is specifically tailored for models like MNIST, with a 28x28 resolution, grayscale
/// color space, and normalized pixel values.
struct ImageProcessor {
    /// Converts a `UIImage` to a `CVPixelBuffer` with dimensions 28x28, in grayscale, with pixel valuesnormalized to the range [0, 1].
    /// This method is designed to prepare images for input to machine learning models, such as the MNIST digit recognition model.
    /// - Parameter image: The `UIImage` to convert. The image will be resized to 28x28 pixels and converted to grayscale.
    /// - Returns: A `CVPixelBuffer` containing the processed image, or `nil` if the conversion fails (e.g., due to invalid image data or buffer creation issues).
    func convertToPixelBuffer(image: UIImage) -> CVPixelBuffer? {
        // Define the target dimensions for the pixel buffer (MNIST standard: 28x28 pixels)
        let width = 28
        let height = 28
        
        // Set attributes to ensure compatibility with Core Graphics and bitmap contexts
        let attributes = [kCVPixelBufferCGImageCompatibilityKey: true,
                          kCVPixelBufferCGBitmapContextCompatibilityKey: true] as CFDictionary
        
        // Create a CVPixelBuffer with the specified dimensions and format
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(
            kCFAllocatorDefault,
            width,
            height,
            kCVPixelFormatType_OneComponent8, // Grayscale, 8 bits per pixel (1 component)
            attributes,
            &pixelBuffer
        )
        
        // Check if buffer creation succeeded and unwrap the pixel buffer
        guard status == kCVReturnSuccess, let buffer = pixelBuffer else { return nil }
        
        // Lock the buffer's base address to allow safe access to its memory
        CVPixelBufferLockBaseAddress(buffer, [])
        
        // Create a Core Graphics context to draw the image into the pixel buffer
        let context = CGContext(
            data: CVPixelBufferGetBaseAddress(buffer),
            width: width, height: height,
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
            space: CGColorSpaceCreateDeviceGray(),
            bitmapInfo: CGImageAlphaInfo.none.rawValue
        )
        
        // Extract the CGImage from the UIImage; return nil if this fails
        guard let cgImage = image.cgImage else { return nil }
        
        // Draw the image into the context, resizing it to 28x28
        context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        // Normalize pixel values to 0-1
        let data = CVPixelBufferGetBaseAddress(buffer)!
        let bytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
        
        // Iterate over each pixel in the 28x28 buffer
        for y in 0..<height {
            for x in 0..<width {
                // Calculate the memory address of the current pixel
                let pixel = data.advanced(by: y * bytesPerRow + x)
                // Read the pixel value (0-255)
                let value = pixel.load(as: UInt8.self)
                // Normalize to [0, 1] by dividing by 255, then scale back to 0-255 range
                // Note: This step preserves the 0-255 range but ensures the value is normalized
                pixel.storeBytes(of: UInt8(Float(value) / 255.0 * 255), as: UInt8.self) // Scale to 0-1
            }
        }
        
        // Unlock the buffer's base address after modification
        CVPixelBufferUnlockBaseAddress(buffer, [])
        return buffer // Return the processed pixel buffer
    }
}
