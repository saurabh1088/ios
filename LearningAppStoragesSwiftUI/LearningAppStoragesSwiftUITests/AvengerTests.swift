//
//  AvengerTests.swift
//  LearningAppStoragesSwiftUITests
//
//  Created by Saurabh Verma on 17/06/24.
//

import XCTest
@testable import LearningAppStoragesSwiftUI

final class AvengerTests: XCTestCase {
    
    func test_Avenger_icons() {
        XCTAssertEqual("avenger_captain_ironman", Avenger.ironman.icon)
        XCTAssertEqual("avenger_spiderman", Avenger.spiderman.icon)
        XCTAssertEqual("avenger_captain_thor", Avenger.thor.icon)
        XCTAssertEqual("avenger_captain_america", Avenger.captainAmerica.icon)
    }
    
    func test_Avenger_rawValue() {
        XCTAssertEqual("Ironman", Avenger.ironman.rawValue)
        XCTAssertEqual("Spiderman", Avenger.spiderman.rawValue)
        XCTAssertEqual("Thor", Avenger.thor.rawValue)
        XCTAssertEqual("Captain America", Avenger.captainAmerica.rawValue)
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
