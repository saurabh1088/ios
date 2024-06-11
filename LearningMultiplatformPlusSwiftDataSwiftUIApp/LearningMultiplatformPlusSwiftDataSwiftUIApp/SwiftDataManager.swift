//
//  SwiftDataManager.swift
//  LearningMultiplatformPlusSwiftDataSwiftUIApp
//
//  Created by Saurabh Verma on 11/06/24.
//

import Foundation
import SwiftData

struct SwiftDataManager {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}
