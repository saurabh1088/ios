//
//  UpdateDataInKeychainViewModel.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 05/04/24.
//

import Foundation

class UpdateDataInKeychainViewModel: ObservableObject {
    
    let keychainservice: KeychainServicesProvider
    
    init(keychainservice: KeychainServicesProvider) {
        self.keychainservice = keychainservice
    }
    
    func update(secret: String, for user: String) {
        keychainservice.update(secret: secret, for: user)
    }
}
