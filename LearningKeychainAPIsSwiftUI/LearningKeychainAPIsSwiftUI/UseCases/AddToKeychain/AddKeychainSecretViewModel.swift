//
//  AddKeychainSecretViewModel.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 03/04/24.
//

import Foundation

class AddKeychainSecretViewModel: ObservableObject {
    let keychainService: KeychainServicesProvider
    private var shouldSecureMore = false
    
    init(keychainService: KeychainServicesProvider) {
        self.keychainService = keychainService
    }
    
    func addSecret(_ secret: String, of user: String) {
        if shouldSecureMore {
            keychainService.secureWithDemandUserPresence(secret: secret, of: user)
        } else {
            keychainService.secure(secret: secret, of: user)
        }
    }
    
    func accessShouldDemandUserPresence() {
        shouldSecureMore = true
    }
}
