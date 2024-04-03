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
    func retrieveSecret(for user: String) -> String?
}

class KeychainServices: KeychainServicesProvider {
    
    func retrieveSecret(for user: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        
        var item: CFTypeRef?
        
        if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
            if let retrievedItem = item as? [String: Any],
               let username = retrievedItem[kSecAttrAccount as String] as? String,
               let password = retrievedItem[kSecValueData as String] as? Data,
               let secret = String(data: password, encoding: .utf8){
                return secret
            }
        } else {
            print("Error while retrieving data from keychain")
        }
        return nil
    }
    
    
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
