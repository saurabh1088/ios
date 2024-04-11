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
    func secureWithDemandUserPresence(secret: String, of user: String)
    func retrieveSecret(for user: String) -> String?
    func update(secret: String, for user: String)
    func deleteEntry(for user: String)
}

class KeychainServices: KeychainServicesProvider { }

// MARK: -----------------------------------------------------------------------
// MARK: Extension KeychainServices for retrieve functionality
extension KeychainServices {
    
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
                print("Retrieved secret from keychain for user : \(username)")
                return secret
            }
        } else {
            print("Error while retrieving data from keychain")
        }
        return nil
    }
}

// MARK: -----------------------------------------------------------------------
// MARK: Extension KeychainServices for add to keychain functionality
extension KeychainServices {
    
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

// MARK: -----------------------------------------------------------------------
// MARK: Extension KeychainServices for update to keychain functionality
extension KeychainServices {
    
    func update(secret: String, for user: String) {
        guard let newPassword = secret.data(using: .utf8) else {
            return
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user
        ]
        
        let attributes: [String: Any] = [
            kSecValueData as String: newPassword
        ]
        
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        if status == noErr {
            print("Successfully updated secret")
        } else {
            print("Error occurred while updating secret")
        }
    }
}

// MARK: -----------------------------------------------------------------------
// MARK: Extension KeychainServices for delete from keychain functionality
extension KeychainServices {
    
    func deleteEntry(for user: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        if status == noErr {
            print("Successfully deleted")
        } else {
            print("Error while deleting from keychain")
        }
    }
}

// MARK: -----------------------------------------------------------------------
// MARK: Extension KeychainServices for adding an entry which demands user presence
extension KeychainServices {
    
    func secureWithDemandUserPresence(secret: String, of user: String) {
        guard let password = secret.data(using: .utf8) else {
            return
        }
        let error: UnsafeMutablePointer<Unmanaged<CFError>?>? = nil
        let access = SecAccessControlCreateWithFlags(kCFAllocatorDefault,
                                                     kSecAttrAccessibleWhenUnlocked,
                                                     SecAccessControlCreateFlags.devicePasscode,
                                                     error)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user,
            kSecAttrAccessControl as String: access as Any,
            kSecValueData as String: password
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status == noErr {
            print("Item saved successfully")
        } else {
            print("Error while saving secret to keychain")
        }
    }
}
