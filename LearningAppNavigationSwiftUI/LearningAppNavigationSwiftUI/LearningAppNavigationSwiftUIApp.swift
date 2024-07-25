//
//  LearningAppNavigationSwiftUIApp.swift
//  LearningAppNavigationSwiftUI
//
//  Created by Saurabh Verma on 25/07/24.
//

import SwiftUI

@main
struct LearningAppNavigationSwiftUIApp: App {
    @StateObject private var navigationModel = NavigationModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationModel)
        }
    }
}
