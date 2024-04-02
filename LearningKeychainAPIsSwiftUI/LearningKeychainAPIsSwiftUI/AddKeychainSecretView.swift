//
//  AddKeychainSecretView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 02/04/24.
//

import SwiftUI

struct AddKeychainSecretView: View {
    @State private var secret = String()
    
    var body: some View {
        VStack {
            TextField("Secret", text: $secret)
            
            Button {
                
            } label: {
                Text("Add to keychain")
            }

        }
    }
}

#Preview {
    AddKeychainSecretView()
}
