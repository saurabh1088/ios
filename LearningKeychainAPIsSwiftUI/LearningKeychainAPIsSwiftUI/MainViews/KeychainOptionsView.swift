//
//  KeychainOptionsView.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 03/04/24.
//

import SwiftUI
import SwiftUIViewsHelper

struct KeychainOptionsView: View {
    @State private var showAddSecretView = false
    @State private var showRetrievedSecretView = false
    @State private var showUpdateSecretView = false
    @State private var showDeleteSecretView = false
    @State private var showAddSecretSecureView = false
    
    @EnvironmentObject private var viewModelFactory: ViewModelFactory
    
    var body: some View {
        VStack {
            addToKeychainButton
            retrieveFromKeychainButton
            updateSecretInKeychainButton
            deleteFromKeychainButton
            addToKeychainSecuredButton
        }
        .fullScreenBackgroundWith(color: .neonYellow)
    }
    
    @ViewBuilder
    private var addToKeychainButton: some View {
        Button {
            showAddSecretView.toggle()
        } label: {
            Text(KeychainScenarios.add.rawValue)
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                .background(.neonRed)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $showAddSecretView, content: {
            AddKeychainSecretView(viewModel: viewModelFactory.createAddKeychainSecretViewModel())
        })
    }
    
    @ViewBuilder
    private var retrieveFromKeychainButton: some View {
        Button {
            showRetrievedSecretView.toggle()
        } label: {
            Text(KeychainScenarios.retrieve.rawValue)
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                .background(.neonRed)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $showRetrievedSecretView, content: {
            RetrieveDataFromKeychainView(viewModel: viewModelFactory.createRetrieveDataFromKeychainViewModel())
        })
    }
    
    @ViewBuilder
    private var updateSecretInKeychainButton: some View {
        Button {
            showUpdateSecretView.toggle()
        } label: {
            Text(KeychainScenarios.update.rawValue)
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                .background(.neonRed)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $showUpdateSecretView, content: {
            UpdateDataInKeychainView(viewModel: viewModelFactory.createUpdateDataInKeychainViewModel())
        })
    }
    
    @ViewBuilder
    private var deleteFromKeychainButton: some View {
        Button {
            showDeleteSecretView.toggle()
        } label: {
            Text(KeychainScenarios.delete.rawValue)
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                .background(.neonRed)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $showDeleteSecretView, content: {
            DeleteFromKeychainView(viewModel: viewModelFactory.createDeleteFromKeychainViewModel())
        })
    }
    
    @ViewBuilder
    private var addToKeychainSecuredButton: some View {
        Button {
            showAddSecretSecureView.toggle()
        } label: {
            Text(KeychainScenarios.addSecure.rawValue)
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 44)
                .background(.neonRed)
                .foregroundColor(.white)
        }
        .sheet(isPresented: $showAddSecretSecureView, content: {
            AddKeychainSecretView(viewModel: viewModelFactory.createAddKeychainSecretViewModelMoreSecure())
        })
    }
}

#Preview {
    KeychainOptionsView()
}
