//
//  ContentView.swift
//  LearningAppNavigationSwiftUI
//
//  Created by Saurabh Verma on 25/07/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationModel: NavigationModel
    
    var body: some View {
        NavigationStack(path: $navigationModel.navigationPath) {
            List(RootViewOption.allCases) { option in
                NavigationLink(option.displayValue, value: option)
            }
            .navigationDestination(for: RootViewOption.self) { destination in
                switch destination {
                case .rootViewOptionOne:
                    PrimaryLevelOneView()
                case .rootViewOptionTwo:
                    PrimaryLevelTwoView()
                case .rootViewOptionThree:
                    PrimaryLevelThreeView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
