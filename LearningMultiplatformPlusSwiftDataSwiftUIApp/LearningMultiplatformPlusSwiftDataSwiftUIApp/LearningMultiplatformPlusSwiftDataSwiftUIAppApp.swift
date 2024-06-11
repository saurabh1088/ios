//
//  LearningMultiplatformPlusSwiftDataSwiftUIAppApp.swift
//  LearningMultiplatformPlusSwiftDataSwiftUIApp
//
//  Created by Saurabh Verma on 11/06/24.
//

import SwiftUI
import SwiftData

@main
struct LearningMultiplatformPlusSwiftDataSwiftUIAppApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(SwiftDataManager().sharedModelContainer)
    }
}
