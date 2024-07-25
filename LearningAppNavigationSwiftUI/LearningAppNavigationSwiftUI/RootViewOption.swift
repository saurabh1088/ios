//
//  RootViewOption.swift
//  LearningAppNavigationSwiftUI
//
//  Created by Saurabh Verma on 25/07/24.
//

import Foundation

enum RootViewOption: String, CaseIterable, Identifiable {
    case rootViewOptionOne
    case rootViewOptionTwo
    case rootViewOptionThree
    
    var displayValue: String {
        switch self {
        case .rootViewOptionOne:
            return "Root View Option One"
        case .rootViewOptionTwo:
            return "Root View Option Two"
        case .rootViewOptionThree:
            return "Root View Option Three"
        }
    }
    
    var id: String { rawValue }
}
