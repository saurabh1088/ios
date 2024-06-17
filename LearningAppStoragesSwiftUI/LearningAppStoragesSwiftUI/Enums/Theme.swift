//
//  Theme.swift
//  LearningAppStoragesSwiftUI
//
//  Created by Saurabh Verma on 16/06/24.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable {
    case blue
    case mint
    case orange
    case purple
    case red
    case yellow
    
    var color: Color {
        switch self {
        case .blue:
            return .blue
        case .mint:
            return .mint
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .red:
            return .red
        case .yellow:
            return .yellow
        }
    }
    
    static func colorFor(value: String) -> Color {
        switch value {
        case Theme.blue.rawValue:
            return .blue
        case Theme.mint.rawValue:
            return .mint
        case Theme.orange.rawValue:
            return .orange
        case Theme.purple.rawValue:
            return .purple
        case Theme.red.rawValue:
            return .red
        case Theme.yellow.rawValue:
            return .yellow
        default:
            return .red
        }
    }
}
