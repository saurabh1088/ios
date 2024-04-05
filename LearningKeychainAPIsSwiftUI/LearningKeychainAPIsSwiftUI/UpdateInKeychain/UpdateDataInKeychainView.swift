//
//  UpdateDataInKeychainView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 05/04/24.
//

import SwiftUI

struct UpdateDataInKeychainView: View {
    @ObservedObject var viewModel: UpdateDataInKeychainViewModel
    
    @State private var username = "user"
    @State private var secret = String()
    
    var body: some View {
        VStack {
            TextField(text: $username) {
                Text("User")
            }
            .disabled(true)
            
            TextField(text: $secret) {
                Text("Secret")
            }
            
            Button {
                viewModel.update(secret: secret, for: username)
            } label: {
                Text("Update")
                    .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                    .background(.red)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    UpdateDataInKeychainView(viewModel: UpdateDataInKeychainViewModel(keychainservice: KeychainServices()))
}
