//
//  AddKeychainSecretViewModel.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 03/04/24.
//

import Foundation

class AddKeychainSecretViewModel: ObservableObject {
    let keychainService: KeychainServicesProvider
    
    init(keychainService: KeychainServicesProvider) {
        self.keychainService = keychainService
    }
    
    func addSecret(_ secret: String, of user: String) {
        keychainService.secure(secret: secret, of: user)
    }
}
