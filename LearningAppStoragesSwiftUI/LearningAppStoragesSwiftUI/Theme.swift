//
//  Theme.swift
//  LearningAppStoragesSwiftUI
//
//  Created by Saurabh Verma on 16/06/24.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable {
    case red
    case blue
    case yellow
    case purple
    case orange
    case mint
    
    var color: Color {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        case .purple:
            return .purple
        case .orange:
            return .orange
        case .mint:
            return .mint
        }
    }
    
    static func colorFor(value: String) -> Color {
        switch value {
        case Theme.red.rawValue:
            return .red
        case Theme.blue.rawValue:
            return .blue
        case Theme.yellow.rawValue:
            return .yellow
        case Theme.purple.rawValue:
            return .purple
        case Theme.orange.rawValue:
            return .orange
        case Theme.mint.rawValue:
            return .mint
        default:
            return .red
        }
    }
}
