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
                    let image = saveAsImage()
                    recognizeDigit(from: image)
                }
                .padding()
            }
        }
    }
    
    func saveAsImage() -> UIImage {
        /// Why 28x28?
        /// Because, MNIST model expects a 28x28 pixel grayscale image, so we draw directly in this size.
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 28, height: 28))
        return renderer.image { context in
            // Black background
            // MNIST data typically has white digits on a black background, hence set like this
            // Using reverse reduces the capability of model drastically
            UIColor.black.setFill()
            context.fill(CGRect(x: 0, y: 0, width: 28, height: 28))
            
            // Scale points from 300x300 to 28x28
            let scaleX = 28.0 / 300.0
            let scaleY = 28.0 / 300.0

            let path = UIBezierPath()
            path.lineWidth = 2
            UIColor.white.setStroke()
            
            for stroke in viewModel.strokes {
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
