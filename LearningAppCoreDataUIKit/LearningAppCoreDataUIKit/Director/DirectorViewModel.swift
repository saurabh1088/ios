//
//  DirectorViewModel.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 24/03/24.
//

import Foundation
import CoreData

protocol DirectorViewModelProtocol: HasManagedContext {
    func fetchDirectors()
    func add(director name: String)
    func deleteDirector(at indexPath: IndexPath )
}

class DirectorViewModel: DirectorViewModelProtocol {
    var managedContext: NSManagedObjectContext
    
    var directors = [Director]()
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func fetchDirectors() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Director")
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in result {
                directors.append(data as! Director)
            }
        } catch {
            print("Some error occurred while trying to fetch director")
        }
    }
    
    func add(director name: String) {
        let directorEntity = NSEntityDescription.entity(forEntityName: "Director", in: managedContext)!
        let newDirector = NSManagedObject(entity: directorEntity, insertInto: managedContext)
        newDirector.setValue(name, forKey: "name")
        do {
            try managedContext.save()
        } catch {
            print("Some error occured while trying to add new director")
        }
    }
    
    func deleteDirector(at indexPath: IndexPath) {
        managedContext.delete(directors[indexPath.row])
        directors.remove(at: indexPath.row)
        do {
            try managedContext.save()
        } catch {
            print("Some error occured while trying to delete director")
        }
    }
}
