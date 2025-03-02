//
//  ContentView.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 27/02/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        NavigationStack {
            NavigationLink("Digits Recognizer", destination: DigitsRecognizerView())
        }
    }
}

#Preview {
    ContentView()
}
