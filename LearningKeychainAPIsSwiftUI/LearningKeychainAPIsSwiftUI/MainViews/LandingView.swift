//
//  LandingView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 02/04/24.
//

import SwiftUI

struct LandingView: View {
    @State private var animate: Bool = false
    @State private var showKeychainOptions: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "key")
                .resizable()
                .scaleEffect(animate ? 0.4 : 0.1)
            Text("Keychain")
            
            Button {
                showKeychainOptions.toggle()
            } label: {
                Text("Start")
                    .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                    .background(.neonRed)
                    .foregroundColor(.white)
            }
            .fullScreenCover(isPresented: $showKeychainOptions, content: {
                KeychainOptionsView()
            })
        }
        .background(Color.neonYellow)
        .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    LandingView()
}
