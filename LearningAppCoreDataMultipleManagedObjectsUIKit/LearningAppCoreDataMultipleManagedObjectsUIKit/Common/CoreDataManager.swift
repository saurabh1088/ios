//
//  CoreDataManager.swift
//  LearningAppCoreDataMultipleManagedObjectsUIKit
//
//  Created by Saurabh Verma on 14/07/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        guard let bikeModelURL = Bundle.main.url(forResource: "Bikes", withExtension: "momd"),
              let companyModelURL = Bundle.main.url(forResource: "Companies", withExtension: "momd"),
              let ridingGearModelURL = Bundle.main.url(forResource: "RidingGear", withExtension: "momd") else {
            fatalError("Some error in loading model files")
        }
        
        // TODO: Remove this forced unwrapping
        let bikeManagedModel = NSManagedObjectModel(contentsOf: bikeModelURL)!
        let companyManagedModel = NSManagedObjectModel(contentsOf: companyModelURL)!
        let ridingGearManagedModel = NSManagedObjectModel(contentsOf: ridingGearModelURL)!
        
        let mergedManagedModel = NSManagedObjectModel(byMerging: [bikeManagedModel,
                                                                  companyManagedModel,
                                                                  ridingGearManagedModel])!
        
        // TODO: Remove this forced unwrapping
        let container = NSPersistentContainer(name: "MergedModel", managedObjectModel: mergedManagedModel)
        container.viewContext.undoManager = UndoManager()
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
