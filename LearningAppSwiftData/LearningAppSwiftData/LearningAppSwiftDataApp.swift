//
//  LearningAppSwiftDataApp.swift
//  LearningAppSwiftData
//
//  Created by Saurabh Verma on 13/06/24.
//

import SwiftUI
import SwiftData

@main
struct LearningAppSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Bike.self)
    }
}
