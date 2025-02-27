//
//  ContentView.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 27/02/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @StateObject private var viewModel = DrawingViewModel()

    var body: some View {
        VStack {
            DrawingView(viewModel: viewModel)
                .frame(width: 300, height: 300)
                .border(Color.black)

            HStack {
                Button("Clear") {
                    viewModel.clear()
                }
                .padding()
                
                Button("Save") {
                    let image = saveAsImage()
                    // Send `image` to ML model
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
            UIColor.white.setFill()
            context.fill(CGRect(x: 0, y: 0, width: 28, height: 28))

            let path = UIBezierPath()
            path.lineWidth = 5
            UIColor.black.setStroke()
            
            for stroke in viewModel.strokes {
                if let first = stroke.first {
                    path.move(to: first)
                    for point in stroke.dropFirst() {
                        path.addLine(to: point)
                    }
                }
            }
            
            path.stroke()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
