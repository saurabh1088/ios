//
//  BikesViewModel.swift
//  LearningAppCoreDataMultipleManagedObjectsUIKit
//
//  Created by Saurabh Verma on 14/07/24.
//

import Foundation
import CoreData

class BikesViewModel {
    let navigationTitle = "Bikes"
    var bikes = [Bike]()
}

extension BikesViewModel {
    // TODO: Just for tempporary inserts, need to remove this with proper implementation
    func insertBikes() {
        let bikeEntity = NSEntityDescription.entity(forEntityName: "Bike", in: CoreDataManager.shared.persistentContainer.viewContext)!
        let newBike = NSManagedObject(entity: bikeEntity, insertInto: CoreDataManager.shared.persistentContainer.viewContext)
        newBike.setValue("Duke 390", forKey: "name")
        newBike.setValue(390, forKey: "engineCapacity")
        do {
            try CoreDataManager.shared.persistentContainer.viewContext.save()
        } catch {
            print("Some error occured while trying to add new bike")
        }
    }
}

extension BikesViewModel {
    func fetchBikes() {
        var fetchedBike = [Bike]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Bike")
        do {
            let result = try CoreDataManager.shared.persistentContainer.viewContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in result {
                fetchedBike.append(data as! Bike)
            }
            bikes = fetchedBike
        } catch {
            print("Some error occurred while trying to fetch bikes")
        }
    }
}
