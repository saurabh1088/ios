//
//  StoryboardSegueOption.swift
//  LearningAppStoryboardSegueOptionsUIKit
//
//  Created by Saurabh Verma on 13/12/24.
//

import Foundation

enum StoryboardSegueOption: String, CaseIterable, Identifiable {
    
    case showFromViewController
    case showFromNavigationController
    case showDetailFromViewController
    case showDetailFromNavigationController
    case presentModally
    case presentAsPopover
    
    var id: String { rawValue }
    
    var printableDescription: String {
        switch self {
        case .showFromViewController:
            return "Show From View Controller"
        case .showFromNavigationController:
            return "Show From Navigation Controller"
        case .showDetailFromViewController:
            return "Show Detail From View Controller"
        case .showDetailFromNavigationController:
            return "Show Detail From Navigation Controller"
        case .presentModally:
            return "Present Modally"
        case .presentAsPopover:
            return "Present As Popover"
        }
    }
    
    func cellReUseIdentifier() -> String {
        switch self {
        case .showFromViewController:
            return "showFromViewControllerSegueCell"
        case .showFromNavigationController:
            return "showFromNavigationControllerSegueCell"
        case .showDetailFromViewController:
            return "showDetailFromViewControllerSegueCell"
        case .showDetailFromNavigationController:
            return "showDetailFromNavigationControllerSegueCell"
        case .presentModally:
            return "presentModallySegueCell"
        case .presentAsPopover:
            return "presentAsPopoverSegueCell"
        }
    }
    
    static func segueTypeFor(index: IndexPath) -> StoryboardSegueOption? {
        switch index.row {
        case 0:
            return .showFromViewController
        case 1:
            return .showFromNavigationController
        case 2:
            return .showDetailFromViewController
        case 3:
            return .showDetailFromNavigationController
        case 4:
            return .presentModally
        case 5:
            return .presentAsPopover
        default:
            return nil
        }
    }
}
