//
//  ViewModelFactory.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 11/04/24.
//

import Foundation

protocol ViewModelFactoryProvider {
    var keychainServiceProvider: KeychainServicesProvider { get set }
    func createAddKeychainSecretViewModel() -> AddKeychainSecretViewModel
    func createAddKeychainSecretViewModelMoreSecure() -> AddKeychainSecretViewModel
    func createDeleteFromKeychainViewModel() -> DeleteFromKeychainViewModel
    func createRetrieveDataFromKeychainViewModel() -> RetrieveDataFromKeychainViewModel
    func createUpdateDataInKeychainViewModel() -> UpdateDataInKeychainViewModel
}

class ViewModelFactory: ObservableObject, ViewModelFactoryProvider {
    
    var keychainServiceProvider: any KeychainServicesProvider
    
    init(keychainServiceProvider: any KeychainServicesProvider) {
        self.keychainServiceProvider = keychainServiceProvider
    }
    
    func createAddKeychainSecretViewModel() -> AddKeychainSecretViewModel {
        return AddKeychainSecretViewModel(keychainService: keychainServiceProvider)
    }
    
    func createAddKeychainSecretViewModelMoreSecure() -> AddKeychainSecretViewModel {
        let viewModel = AddKeychainSecretViewModel(keychainService: keychainServiceProvider)
        viewModel.accessShouldDemandUserPresence()
        return viewModel
    }
    
    func createDeleteFromKeychainViewModel() -> DeleteFromKeychainViewModel {
        return DeleteFromKeychainViewModel(keychainservice: keychainServiceProvider)
    }
    
    func createRetrieveDataFromKeychainViewModel() -> RetrieveDataFromKeychainViewModel {
        return RetrieveDataFromKeychainViewModel(keychainService: keychainServiceProvider)
    }
    
    func createUpdateDataInKeychainViewModel() -> UpdateDataInKeychainViewModel {
        return UpdateDataInKeychainViewModel(keychainservice: keychainServiceProvider)
    }
}
