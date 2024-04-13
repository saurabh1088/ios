//
//  AddKeychainSecretView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 02/04/24.
//

import SwiftUI

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
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color.neonYellow)
    }
}

#Preview {
    AddKeychainSecretView(viewModel: AddKeychainSecretViewModel(keychainService: KeychainServices()))
}
