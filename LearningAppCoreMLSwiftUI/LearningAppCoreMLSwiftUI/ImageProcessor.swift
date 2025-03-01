//
//  ImageProcessor.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 01/03/25.
//

import Foundation
import CoreVideo
import UIKit

struct ImageProcessor {
    /// Converts a UIImage to a CVPixelBuffer with dimensions 28x28, grayscale, and normalized pixel values.
    /// - Parameter image: The UIImage to convert.
    /// - Returns: A CVPixelBuffer, or nil if conversion fails.
    func convertToPixelBuffer(image: UIImage) -> CVPixelBuffer? {
        let width = 28
        let height = 28
        let attributes = [kCVPixelBufferCGImageCompatibilityKey: true,
                          kCVPixelBufferCGBitmapContextCompatibilityKey: true] as CFDictionary
        var pixelBuffer: CVPixelBuffer?
        
        let status = CVPixelBufferCreate(kCFAllocatorDefault, width, height,
                                         kCVPixelFormatType_OneComponent8, attributes, &pixelBuffer)
        guard status == kCVReturnSuccess, let buffer = pixelBuffer else { return nil }
        
        CVPixelBufferLockBaseAddress(buffer, [])
        let context = CGContext(data: CVPixelBufferGetBaseAddress(buffer),
                                width: width, height: height,
                                bitsPerComponent: 8,
                                bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
                                space: CGColorSpaceCreateDeviceGray(),
                                bitmapInfo: CGImageAlphaInfo.none.rawValue)
        guard let cgImage = image.cgImage else { return nil }
        context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        // Normalize pixel values to 0-1
        let data = CVPixelBufferGetBaseAddress(buffer)!
        let bytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
        for y in 0..<height {
            for x in 0..<width {
                let pixel = data.advanced(by: y * bytesPerRow + x)
                let value = pixel.load(as: UInt8.self)
                pixel.storeBytes(of: UInt8(Float(value) / 255.0 * 255), as: UInt8.self) // Scale to 0-1
            }
        }
        
        CVPixelBufferUnlockBaseAddress(buffer, [])
        return buffer
    }
}
