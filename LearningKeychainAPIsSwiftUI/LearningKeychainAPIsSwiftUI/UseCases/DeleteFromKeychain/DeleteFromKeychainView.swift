//
//  DeleteFromKeychainView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 05/04/24.
//

import SwiftUI

struct DeleteFromKeychainView: View {
    
    @ObservedObject var viewModel: DeleteFromKeychainViewModel
    @State private var username = "user"
    
    var body: some View {
        VStack {
            TextField(text: $username) {
                Text("User")
            }
            
            Button {
                viewModel.delete(user: username)
            } label: {
                Text("Delete")
                    .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                    .background(.neonRed)
                    .foregroundColor(.white)
            }
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color.neonYellow)
    }
}

#Preview {
    DeleteFromKeychainView(viewModel: DeleteFromKeychainViewModel(keychainservice: KeychainServices()))
}
