//
//  ColorOption.swift
//  LearningAppiPadSwiftUI
//
//  Created by Saurabh Verma on 19/08/24.
//

import Foundation
import SwiftUI

enum ColorOption: String, CaseIterable, Identifiable {
    
    // MARK: Enum cases
    case blue
    case green
    case red
    case yellow
    case cyan
    
    var printValue: String {
        switch self {
        case .blue:
            return "Blue"
        case .green:
            return "Green"
        case .red:
            return "Red"
        case .yellow:
            return "Yellow"
        case .cyan:
            return "Cyan"
        }
    }
    
    var value: Color {
        switch self {
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        case .red:
            return Color.red
        case .yellow:
            return Color.yellow
        case .cyan:
            return Color.cyan
        }
    }
    
    var allColors: [Color] {
        ColorOption.allCases.map({ $0.value })
    }
    
    // MARK: Identifiable conformance
    var id: String { rawValue }
    
}
