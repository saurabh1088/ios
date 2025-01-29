//
//  NetworkingManager.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 27/01/25.
//

import Foundation
import SwiftNetworking

protocol NetworkingManagerProtocol {
    var sessionManager: APISessionManagerProtocol { get set }
}

class NetworkingManager: NetworkingManagerProtocol {
    var sessionManager: APISessionManagerProtocol
    
    private init(sessionManager: APISessionManagerProtocol) {
        self.sessionManager = sessionManager
    }
    
    static let shared: NetworkingManagerProtocol = {
        let sessionManager = APISessionManager()
        return NetworkingManager(sessionManager: sessionManager)
    }()
}
