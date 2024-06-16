//
//  Hero.swift
//  LearningAppStoragesSwiftUI
//
//  Created by Saurabh Verma on 16/06/24.
//

import Foundation

enum JusticeLeague: String, CaseIterable {
    case batman = "Batman"
    case superman = "Superman"
    case wonderWoman = "Wonder Woman"
    case flash = "Flash"
    case aquaman = "Aquaman"
    case greenLantern = "Green Lantern"
    
    var icon: String {
        switch self {
        case .batman:
            "justice_league_batman"
        case .superman:
            "justice_league_superman"
        case .wonderWoman:
            "justice_league_wonder_woman"
        case .flash:
            "justice_league_flash"
        case .aquaman:
            "justice_league_aquaman"
        case .greenLantern:
            "justice_league_green_lantern"
        }
    }
}

enum Avenger: String, CaseIterable {
    case ironman = "Ironman"
    case spiderman = "Spiderman"
    case thor = "Thor"
    case captainAmerica = "Captain America"
    
    var icon: String {
        switch self {
        case .ironman:
            "avenger_captain_ironman"
        case .spiderman:
            "avenger_spiderman"
        case .thor:
            "avenger_captain_thor"
        case .captainAmerica:
            "avenger_captain_america"
        }
    }
}
