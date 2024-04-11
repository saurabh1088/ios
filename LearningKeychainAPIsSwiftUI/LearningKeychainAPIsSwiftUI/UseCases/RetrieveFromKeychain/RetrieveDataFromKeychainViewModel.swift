//
//  RetrieveDataFromKeychainViewModel.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 03/04/24.
//

import Foundation

class RetrieveDataFromKeychainViewModel: ObservableObject {
    let keychainService: KeychainServicesProvider
    
    init(keychainService: KeychainServicesProvider) {
        self.keychainService = keychainService
    }
    
    func retrieveSecret(of user: String) -> String {
        return keychainService.retrieveSecret(for: user) ?? "NOT FOUND"
    }
}
