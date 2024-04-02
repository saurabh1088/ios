//
//  KeychainServices.swift
//  LearningKeychainAPIsSwiftUI
//
//  Created by Saurabh Verma on 02/04/24.
//

import Foundation
import Security

protocol KeychainServicesProvider {
    func secure(secret: String, of user: String)
}

class KeychainServices: KeychainServicesProvider {
    
    func secure(secret: String, of user: String) {
        guard let password = secret.data(using: .utf8) else {
            return
        }
        
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user,
            kSecValueData as String: password
        ]
        
        if SecItemAdd(attributes as CFDictionary, nil) == noErr {
            print("Item saved successfully")
        } else {
            print("Error while saving secret to keychain")
        }
    }
}
