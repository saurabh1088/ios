//
//  Common.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 09/03/24.
//

import Foundation

typealias BasicBlock = () -> ()

enum CoreDataScenario: String, CaseIterable {
    case movies = "Movies"
    case director = "Director"
    
    static func scenarioFor(index: Int) -> CoreDataScenario? {
        switch index {
        case 0:
            return .movies
        case 1:
            return .director
        default:
            return nil
        }
    }
    
    var cellReuseIdentifier: String {
        switch self {
        case .movies:
            return "coreDataScenarioMoviesTableViewCell"
        case .director:
            return "coreDataScenarioDirectorTableViewCell"
        }
    }
}
