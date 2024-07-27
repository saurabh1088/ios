//
//  Storyboard.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 27/07/24.
//

import Foundation
import UIKit

enum Storyboard {
    enum Main: Identifiable {
        case viewController
        case bikeViewController
        case addNewBikeViewController
        
        var id: String {
            switch self {
            case .viewController:
                "viewControllerStoryboardId"
            case .bikeViewController:
                "bikesViewControllerStoryboardId"
            case .addNewBikeViewController:
                "addNewBikeViewControllerStoryboardId"
            }
        }
        
        var instantiate: UIViewController {
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: self.id)
        }
    }
}
