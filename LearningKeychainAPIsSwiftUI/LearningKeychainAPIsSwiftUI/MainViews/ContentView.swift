//
//  ContentView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LandingView()
                .environmentObject(ViewModelFactory(keychainServiceProvider: KeychainServices()))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
