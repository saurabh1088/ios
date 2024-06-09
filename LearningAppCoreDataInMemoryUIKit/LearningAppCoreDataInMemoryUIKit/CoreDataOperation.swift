//
//  CoreDataOperation.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 09/06/24.
//

import Foundation

enum CoreDataOperation {
    case fetch(String)
    case save(String)
    case delete(String)
    
    var errorDescription: String {
        switch self {
        case .fetch(let string):
            return "Error occured while performing fetch on core data stack : \(string)"
        case .save(let string):
            return "Error occured while performing save on core data stack : \(string)"
        case .delete(let string):
            return "Error occured while performing delete on core data stack : \(string)"
        }
    }
}
