//
//  MockKeychainService.swift
//  LearningKeychainAPIsSwiftUITests
//
//  Created by Saurabh Verma on 10/04/24.
//

import Foundation
@testable import LearningKeychainAPIsSwiftUI

class MockKeychainService: KeychainServicesProvider {
    
    private var storage = [String: String]()
    
    func secure(secret: String, of user: String) {
        storage[user] = secret
    }
    
    func secureWithDemandUserPresence(secret: String, of user: String) {
        storage[user] = secret
    }
    
    func retrieveSecret(for user: String) -> String? {
        storage[user]
    }
    
    func update(secret: String, for user: String) {
        storage[user] = secret
    }
    
    func deleteEntry(for user: String) {
        storage.removeValue(forKey: user)
    }
}
