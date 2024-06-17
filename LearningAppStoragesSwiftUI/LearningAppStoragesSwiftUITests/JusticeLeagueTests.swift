//
//  JusticeLeagueTests.swift
//  LearningAppStoragesSwiftUITests
//
//  Created by Saurabh Verma on 17/06/24.
//

import XCTest
@testable import LearningAppStoragesSwiftUI

final class JusticeLeagueTests: XCTestCase {
    
    func test_JusticeLeague_icons() {
        XCTAssertEqual("justice_league_batman", JusticeLeague.batman.icon)
        XCTAssertEqual("justice_league_superman", JusticeLeague.superman.icon)
        XCTAssertEqual("justice_league_wonder_woman", JusticeLeague.wonderWoman.icon)
        XCTAssertEqual("justice_league_flash", JusticeLeague.flash.icon)
        XCTAssertEqual("justice_league_aquaman", JusticeLeague.aquaman.icon)
        XCTAssertEqual("justice_league_green_lantern", JusticeLeague.greenLantern.icon)
    }
    
    func test_JusticeLeague_rawValue() {
        XCTAssertEqual("Batman", JusticeLeague.batman.rawValue)
        XCTAssertEqual("Superman", JusticeLeague.superman.rawValue)
        XCTAssertEqual("Wonder Woman", JusticeLeague.wonderWoman.rawValue)
        XCTAssertEqual("Flash", JusticeLeague.flash.rawValue)
        XCTAssertEqual("Aquaman", JusticeLeague.aquaman.rawValue)
        XCTAssertEqual("Green Lantern", JusticeLeague.greenLantern.rawValue)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
