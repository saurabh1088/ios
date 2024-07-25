//
//  NavigationModel.swift
//  LearningAppNavigationSwiftUI
//
//  Created by Saurabh Verma on 25/07/24.
//

import Foundation
import SwiftUI

class NavigationModel: ObservableObject {
    @Published var navigationPath = NavigationPath()
}
