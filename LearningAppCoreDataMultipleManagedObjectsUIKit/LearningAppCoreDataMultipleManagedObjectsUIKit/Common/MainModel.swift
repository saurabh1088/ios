//
//  MainModel.swift
//  LearningAppCoreDataMultipleManagedObjectsUIKit
//
//  Created by Saurabh Verma on 14/07/24.
//

import Foundation

enum MainModel: String, CaseIterable {
    case bike = "Bikes"
    case company = "Company"
    case ridingGear = "Riding Gear"
    
    static func modelTypeFor(index: Int) -> MainModel? {
        switch index {
        case 0:
            return .bike
        case 1:
            return .company
        case 2:
            return .ridingGear
        default:
            return nil
        }
    }
    
    var cellReUseIdentifier: String {
        switch self {
        case .bike:
            return "bikeTableViewCell"
        case .company:
            return "companyTableViewCell"
        case .ridingGear:
            return "ridingGearTableViewCell"
        }
    }
    
    var storyBoardSegue: String {
        switch self {
        case .bike:
            return "showBikes"
        case .company:
            return "showCompanies"
        case .ridingGear:
            return "showRidingGears"
        }
    }
}
