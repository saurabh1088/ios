//
//  RidingGearViewModel.swift
//  LearningAppCoreDataMultipleManagedObjectsUIKit
//
//  Created by Saurabh Verma on 14/07/24.
//

import Foundation
import CoreData

class RidingGearViewModel {
    let navigationTitle = "Riding Gear"
    var ridingGears = [RidingGear]()
}

extension RidingGearViewModel {
    func insertRidingGear() {
        let ridingGearEntity = NSEntityDescription.entity(forEntityName: "RidingGear", in: CoreDataManager.shared.persistentContainer.viewContext)!
        let newRidingGear = NSManagedObject(entity: ridingGearEntity, insertInto: CoreDataManager.shared.persistentContainer.viewContext)
        newRidingGear.setValue("Gloves", forKey: "name")
        do {
            try CoreDataManager.shared.persistentContainer.viewContext.save()
        } catch {
            print("Some error occured while trying to add new gear")
        }
        
    }
}

extension RidingGearViewModel {
    // TODO: Just for tempporary inserts, need to remove this with proper implementation
    func fetchRidingGear() {
        var fetcherGears = [RidingGear]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RidingGear")
        do {
            let results = try CoreDataManager.shared.persistentContainer.viewContext.fetch(fetchRequest)
            for data in results {
                fetcherGears.append(data as! RidingGear)
            }
            ridingGears = fetcherGears
        } catch {
            print("Some error occurred while trying to fetch riding gear")
        }
    }
}
