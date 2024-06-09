//
//  CoreDataMemoryOption.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 08/06/24.
//

import Foundation
import CoreData

enum CoreDataMemoryOption: String, CaseIterable {
    case inMemory = "In Memory"
    case onDisk = "On Disk"
    
    var cellReUseIdentifier: String {
        switch self {
        case .inMemory, .onDisk:
            return "coreDataMemoryOptionTableViewCell"
        }
    }
    
    static func memoryOptionFor(index: Int) -> CoreDataMemoryOption? {
        switch index {
        case 0:
            return .inMemory
        case 1:
            return .onDisk
        default:
            return nil
        }
    }
    
    var persistentContainer: NSPersistentContainer {
        switch self {
        case .inMemory:
            return CoreDataManager.shared.inMemoryPersistentContainer
        case .onDisk:
            return CoreDataManager.shared.onDiskPersistentContainer
        }
    }
    
    func saveContext(_ operation: CoreDataOperation? = nil) {
        switch self {
        case .inMemory:
            CoreDataManager.shared.saveInMemoryContext(operation)
        case .onDisk:
            CoreDataManager.shared.saveOnDiskContext(operation)
        }
    }
}
