//
//  Item.swift
//  LearningAppCoreMLSwiftUI
//
//  Created by Saurabh Verma on 27/02/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
