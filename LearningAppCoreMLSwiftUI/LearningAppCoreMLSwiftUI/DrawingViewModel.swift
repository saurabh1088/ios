//
//  DrawingViewModel.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 27/02/25.
//

import Foundation

class DrawingViewModel: ObservableObject {
    /// Stores all the strokes on view
    @Published var strokes: [[CGPoint]] = [[]]
    
    func addPoint(_ point: CGPoint) {
        strokes[strokes.count - 1].append(point)
        objectWillChange.send()
    }
    
    func startNewStroke() {
        strokes.append([])
    }
    
    func clear() {
        strokes = [[]]
    }
}
