//
//  ContentView.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 27/02/25.
//

import SwiftUI
import SwiftData
import CoreML
import Vision

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @StateObject private var viewModel = DrawingViewModel()
    @State private var recognizedDigit: String = "?"

    var body: some View {
        VStack {
            DrawingView(viewModel: viewModel)
                .frame(width: 300, height: 300)
                .border(Color.black)
            
            Text("Recognized Digit: \(recognizedDigit)")
                .font(.largeTitle)
                .padding()

            HStack {
                Button("Clear") {
                    viewModel.clear()
                    recognizedDigit = "?"
                }
                .padding()
                
                Button("Save") {
                    let image = DigitImageRenderer.saveAsImage(strokes: viewModel.strokes)
                    recognizeDigit(from: image)
                }
                .padding()
            }
        }
    }
    
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
    
    func recognizeDigit(from image: UIImage) {
        do {
            let model = try VNCoreMLModel(for: MNISTClassifier(configuration: MLModelConfiguration()).model)
            
            let request = VNCoreMLRequest(model: model) { request, _ in
                if let results = request.results as? [VNClassificationObservation],
                   let topResult = results.first {
                    DispatchQueue.main.async {
                        recognizedDigit = topResult.identifier // Extract the predicted digit
                        print("Recognized Digit: \(topResult.identifier), Confidence: \(topResult.confidence)")
                    }
                } else {
                    print("No valid results found")
                }
            }

            guard let buffer = convertToPixelBuffer(image: image) else {
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

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
