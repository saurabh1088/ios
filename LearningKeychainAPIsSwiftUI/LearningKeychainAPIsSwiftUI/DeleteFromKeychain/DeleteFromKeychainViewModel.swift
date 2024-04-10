//
//  DeleteFromKeychainViewModel.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 05/04/24.
//

import Foundation

class DeleteFromKeychainViewModel: ObservableObject {
    
    let keychainservice: KeychainServicesProvider
    
    init(keychainservice: KeychainServicesProvider) {
        self.keychainservice = keychainservice
    }
    
    func delete(user: String) {
        keychainservice.deleteEntry(for: user)
    }
}
