//
//  PrimaryLevelOneView.swift
//  LearningAppNavigationSwiftUI
//
//  Created by Saurabh Verma on 25/07/24.
//

import SwiftUI

struct PrimaryLevelOneView: View {
    var body: some View {
        List(PrimaryViewOption.LevelOne.allCases) { option in
            NavigationLink(option.displayValue, value: option)
        }
        .navigationDestination(for: PrimaryViewOption.LevelOne.self) { destination in
            switch destination {
            case .optionOne:
                SecondaryLevelOneOnOneView()
            case .optionTwo:
                SecondaryLevelTwoOnOneView()
            case .optionThree:
                SecondaryLevelThreeOnOneView()
            }
        }
    }
}

#Preview {
    PrimaryLevelOneView()
}
