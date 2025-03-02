//
//  DrawingView.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 27/02/25.
//

import SwiftUI

/// A SwiftUI view that provides a canvas for drawing strokes using drag gestures.
/// The view renders user-drawn strokes as black lines on a white background, with drawing logic managed
/// by a `DrawingViewModel`.
struct DrawingView: View {
    /// The view model that manages the drawing state, including strokes and points.
    @ObservedObject var viewModel: DrawingViewModel

    var body: some View {
        /// SwiftUI’s Canvas is used here to draw the strokes. It provides a context (a graphics context)
        /// and size (the canvas dimensions).
        Canvas { context, size in
            // Iterate through each stroke in the view model
            for stroke in viewModel.strokes {
                var path = Path()
                // Ensure the stroke has at least one point to start drawing
                if let firstPoint = stroke.first {
                    path.move(to: firstPoint) // Start the path at the first point
                    // Connect subsequent points with lines
                    for point in stroke.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                // Draw the path with a black color and line width of 5
                context.stroke(path, with: .color(.black), lineWidth: 5)
            }
        }
        .background(Color.white) // Set a white background for the canvas
        .gesture(
            DragGesture(minimumDistance: 0) // Capture drag gestures with no minimum distance
                .onChanged { value in
                    // Add the current drag location to the current stroke
                    viewModel.addPoint(value.location)
                }
                .onEnded { _ in
                    // End the current stroke and start a new one when the drag ends
                    viewModel.startNewStroke()
                }
        )
    }
}

#Preview {
    DrawingView(viewModel: DrawingViewModel())
}
