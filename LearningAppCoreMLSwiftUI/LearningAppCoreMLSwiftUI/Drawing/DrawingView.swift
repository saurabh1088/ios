//
//  DrawingView.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 27/02/25.
//

import SwiftUI

struct DrawingView: View {
    @ObservedObject var viewModel: DrawingViewModel

    var body: some View {
        Canvas { context, size in
            for stroke in viewModel.strokes {
                var path = Path()
                if let firstPoint = stroke.first {
                    path.move(to: firstPoint)
                    for point in stroke.dropFirst() {
                        path.addLine(to: point)
                    }
                }
                context.stroke(path, with: .color(.black), lineWidth: 5)
            }
        }
        .background(Color.white)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    viewModel.addPoint(value.location)
                }
                .onEnded { _ in
                    viewModel.startNewStroke()
                }
        )
    }
}

#Preview {
    DrawingView(viewModel: DrawingViewModel())
}
