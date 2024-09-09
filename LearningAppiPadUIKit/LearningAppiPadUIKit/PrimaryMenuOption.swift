//
//  PrimaryMenuOption.swift
//  LearningAppiPadUIKit
//
//  Created by Saurabh Verma on 09/09/24.
//

import Foundation

enum PrimaryMenuOption: String, CaseIterable, Identifiable {
    case calendar
    case home
    case work
    
    var printValue: String {
        switch self {
        case .calendar:
            return "Calendar"
        case .home:
            return "Home"
        case .work:
            return "Work"
        }
    }
    
    var icon: String {
        switch self {
        case .calendar:
            return "calendar"
        case .home:
            return "house.fill"
        case .work:
            return "building.2.fill"
        }
    }
    
    static func menuOptionFor(index: IndexPath) -> PrimaryMenuOption? {
        switch index.row {
        case 0:
            return .home
        case 1:
            return .work
        case 2:
            return .calendar
        default:
            return nil
        }
    }
    
    var id: String { rawValue }
}
