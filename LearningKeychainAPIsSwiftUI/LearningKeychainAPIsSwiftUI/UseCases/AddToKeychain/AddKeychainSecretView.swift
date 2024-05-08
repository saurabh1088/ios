//
//  AddKeychainSecretView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 02/04/24.
//

import SwiftUI
import SwiftUIViewsHelper

struct AddKeychainSecretView: View {
    @ObservedObject var viewModel: AddKeychainSecretViewModel
    
    @State private var secret = String()
    
    var body: some View {
        VStack {
            TextField("Secret", text: $secret)
            
            Button {
                viewModel.addSecret(secret, of: "user")
            } label: {
                Text("Add to keychain")
            }

        }
        .fullScreenBackgroundWith(color: .neonYellow)
    }
}

#Preview {
    AddKeychainSecretView(viewModel: AddKeychainSecretViewModel(keychainService: KeychainServices()))
}
