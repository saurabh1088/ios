//
//  CoreDataMemoryOption.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 08/06/24.
//

import Foundation

enum CoreDataMemoryOption: String, CaseIterable {
    case inMemory = "In Memory"
    
    static func memoryOptionFor(index: Int) -> CoreDataMemoryOption? {
        switch index {
        case 0:
            return .inMemory
        default:
            return nil
        }
    }
    
    var cellReUseIdentifier: String {
        switch self {
        case .inMemory:
            return "coreDataInMemoryOptionTableViewCell"
        }
    }
}
