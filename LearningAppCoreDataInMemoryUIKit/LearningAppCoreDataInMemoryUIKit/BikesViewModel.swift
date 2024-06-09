//
//  BikesViewModel.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 08/06/24.
//

import Foundation
import CoreData

protocol BikesViewModelProtocol: HasManagedContext {
    func fetchAllBikes()
    func addBike(name: String, maker: String, engineCapacity: Int)
}

class BikesViewModel: BikesViewModelProtocol {
    var managedContext: NSManagedObjectContext
    var bikes = [Bike]()
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func fetchAllBikes() {
        let request: NSFetchRequest<Bike> = Bike.fetchRequest()
        do {
            bikes = try managedContext.fetch(request)
        } catch {
            print("Error while fetching bikes")
        }
    }
    
    func addBike(name: String, maker: String, engineCapacity: Int) {
        let newBike = Bike(context: managedContext)
        newBike.name = name
        newBike.manufacturer = maker
        newBike.engine = Int16(engineCapacity)
        do {
            try managedContext.save()
        } catch {
            print("Error while saving new bike")
        }
    }
    
}
