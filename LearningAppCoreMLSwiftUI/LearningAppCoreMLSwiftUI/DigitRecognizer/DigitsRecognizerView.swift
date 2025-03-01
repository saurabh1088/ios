//
//  DigitsRecognizerView.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 01/03/25.
//

import SwiftUI

struct DigitsRecognizerView: View {
    @StateObject private var viewModel = DrawingViewModel()

    var body: some View {
        VStack {
            DrawingView(viewModel: viewModel)
                .frame(width: 300, height: 300)
                .border(Color.black)
            
            Text("Recognized Digit: \(viewModel.recognizedDigit)")
                .font(.largeTitle)
                .padding()

            HStack {
                Button("Clear") {
                    viewModel.clear()
                    viewModel.recognizedDigit = "?"
                }
                .padding()
                
                Button("Save") {
                    let image = DigitImageRenderer.saveAsImage(strokes: viewModel.strokes)
                    viewModel.recognizeDigit(from: image)
                }
                .padding()
            }
        }
    }
}

#Preview {
    DigitsRecognizerView()
}
