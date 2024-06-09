//
//  HasManagedContext.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 08/06/24.
//

import Foundation
import CoreData

protocol HasManagedContext {
    var managedContext: NSManagedObjectContext { get }
}
