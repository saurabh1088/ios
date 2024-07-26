//
//  PrimaryViewOption.swift
//  LearningAppNavigationSwiftUI
//
//  Created by Saurabh Verma on 26/07/24.
//

import Foundation

enum PrimaryViewOption {
    enum LevelOne: String, CaseIterable, Identifiable, Codable {
        case optionOne
        case optionTwo
        case optionThree
        
        var displayValue: String {
            switch self {
            case .optionOne:
                return "Primary Level One : Option One"
            case .optionTwo:
                return "Primary Level One : Option Two"
            case .optionThree:
                return "Primary Level One : Option Three"
            }
        }
        
        var id: String { rawValue }
    }
    
}
