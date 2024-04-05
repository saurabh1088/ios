//
//  KeychainOptionsView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 03/04/24.
//

import SwiftUI

struct KeychainOptionsView: View {
    @State private var showAddSecretView = false
    @State private var showRetrievedSecretView = false
    @State private var showUpdateSecretView = false
    
    var body: some View {
        VStack {
            addToKeychainButton
            retrieveFromKeychainButton
            updateSecretInKeychainButton
        }
    }
    
    @ViewBuilder
    private var addToKeychainButton: some View {
        Button {
            showAddSecretView.toggle()
        } label: {
            Text("Add")
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                .background(.red)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $showAddSecretView, content: {
            AddKeychainSecretView(viewModel: AddKeychainSecretViewModel(keychainService: KeychainServices()))
        })
    }
    
    @ViewBuilder
    private var retrieveFromKeychainButton: some View {
        Button {
            showRetrievedSecretView.toggle()
        } label: {
            Text("Retrieve")
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                .background(.red)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $showRetrievedSecretView, content: {
            RetrieveDataFromKeychainView(viewModel: RetrieveDataFromKeychainViewModel(keychainService: KeychainServices()))
        })
    }
    
    @ViewBuilder
    private var updateSecretInKeychainButton: some View {
        Button {
            showUpdateSecretView.toggle()
        } label: {
            Text("Update")
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                .background(.red)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $showUpdateSecretView, content: {
            UpdateDataInKeychainView(viewModel: UpdateDataInKeychainViewModel(keychainservice: KeychainServices()))
        })
    }
}

#Preview {
    KeychainOptionsView()
}
