//
//  Bike.swift
//  LearningAppSwiftData
//
//  Created by Saurabh Verma on 13/06/24.
//

import Foundation
import SwiftData

/// Model here needs to be class type, else at runtime below error will be thrown:
/// `Non-class type 'Bike' cannot conform to class protocol 'PersistentModel'`
@Model
class Bike {
    let name: String
    let company: String
    let cubicCapacity: Int
    
    /// Initialiser is required here else compilor will report below error:
    /// `@Model requires an initializer be provided for 'Bike'`
    init(name: String, company: String, cubicCapacity: Int) {
        self.name = name
        self.company = company
        self.cubicCapacity = cubicCapacity
    }
}
