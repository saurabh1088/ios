//
//  RetrieveDataFromKeychainView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 03/04/24.
//

import SwiftUI

struct RetrieveDataFromKeychainView: View {
    
    @ObservedObject var viewModel: RetrieveDataFromKeychainViewModel
    @State private var retrievedData = String()
    
    var body: some View {
        VStack {
            Text(retrievedData)
        }
        .onAppear {
            retrievedData = viewModel.retrieveSecret(of: "user")
        }
    }
}

#Preview {
    RetrieveDataFromKeychainView(viewModel: RetrieveDataFromKeychainViewModel(keychainService: KeychainServices()))
}
