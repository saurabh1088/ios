//
//  Item.swift
//  LearningMultiplatformPlusSwiftDataSwiftUIApp
//
//  Created by Saurabh Verma on 11/06/24.
//

import Foundation
import SwiftData

/**
 `@Model`
 
 `@Model` here is a macro which annotates the model class to make them persistable. The macro at the build
 time will expand to provide conformance to `PersistentModel` and `Observable` protocols.
 This macro empowers one to define the schema like one normally does in standard swift code and with just one
 addition of annotation the model will transform to persistent one without one needing to add lot of code.
 */
@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
