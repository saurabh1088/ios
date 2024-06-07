//
//  CoreDataScenarioTests.swift
//  LearningAppCoreDataUIKitTests
//
//  Created by Saurabh Verma on 07/06/24.
//

import XCTest
@testable import LearningAppCoreDataUIKit

final class CoreDataScenarioTests: XCTestCase {

    func test_coreDataScenarioIndexes_Succes() {
        XCTAssertEqual(CoreDataScenario.movies, CoreDataScenario.scenarioFor(index: 0))
        XCTAssertEqual(CoreDataScenario.director, CoreDataScenario.scenarioFor(index: 1))
    }
    
    func test_coreDataScenarioIndexes_failure() {
        XCTAssertNil(CoreDataScenario.scenarioFor(index: 2))
    }
    
    func test_cellReUseIdentifiers() {
        XCTAssertEqual("coreDataScenarioMoviesTableViewCell", CoreDataScenario.movies.cellReuseIdentifier)
        XCTAssertEqual("coreDataScenarioDirectorTableViewCell", CoreDataScenario.director.cellReuseIdentifier)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
