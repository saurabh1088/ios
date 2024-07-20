//
//  CompaniesViewModel.swift
//  LearningAppCoreDataMultipleManagedObjectsUIKit
//
//  Created by Saurabh Verma on 14/07/24.
//

import Foundation
import CoreData

class CompaniesViewModel {
    let navigationTitle = "Bike Companies"
    var companies = [Company]()
}

extension CompaniesViewModel {
    func insertCompanies() {
        let companyEntity = NSEntityDescription.entity(forEntityName: "Company", in: CoreDataManager.shared.persistentContainer.viewContext)!
        let newCompany = NSManagedObject(entity: companyEntity, insertInto: CoreDataManager.shared.persistentContainer.viewContext)
        newCompany.setValue("KTM", forKey: "name")
        do {
            try CoreDataManager.shared.persistentContainer.viewContext.save()
        } catch {
            print("Some error occured while trying to add new company")
        }
    }
}

extension CompaniesViewModel {
    func fetchCompanies() {
        var fetchedCompany = [Company]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
        do {
            let result = try CoreDataManager.shared.persistentContainer.viewContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in result {
                fetchedCompany.append(data as! Company)
            }
            companies = fetchedCompany
        } catch {
            print("Some error occurred while trying to fetch bikes")
        }
    }
}
