//
//  RetrieveDataFromKeychainView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 03/04/24.
//

import SwiftUI
import SwiftUIViewsHelper

struct RetrieveDataFromKeychainView: View {
    
    @ObservedObject var viewModel: RetrieveDataFromKeychainViewModel
    @State private var retrievedData = String()
    
    var body: some View {
        VStack {
            Text(retrievedData)
        }
        .fullScreenBackgroundWith(color: .neonYellow)
        .onAppear {
            retrievedData = viewModel.retrieveSecret(of: "user")
        }
    }
}

#Preview {
    RetrieveDataFromKeychainView(viewModel: RetrieveDataFromKeychainViewModel(keychainService: KeychainServices()))
}
