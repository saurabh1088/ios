//
//  ThemeTests.swift
//  LearningAppStoragesSwiftUITests
//
//  Created by Saurabh Verma on 16/06/24.
//

import XCTest
import SwiftUI
@testable import LearningAppStoragesSwiftUI

final class ThemeTests: XCTestCase {

    func test_themeColorFor() {
        XCTAssertEqual(Color.blue, Theme.colorFor(value: Theme.blue.rawValue))
        XCTAssertEqual(Color.mint, Theme.colorFor(value: Theme.mint.rawValue))
        XCTAssertEqual(Color.orange, Theme.colorFor(value: Theme.orange.rawValue))
        XCTAssertEqual(Color.purple, Theme.colorFor(value: Theme.purple.rawValue))
        XCTAssertEqual(Color.red, Theme.colorFor(value: Theme.red.rawValue))
        XCTAssertEqual(Color.yellow, Theme.colorFor(value: Theme.yellow.rawValue))
    }
    
    func test_themeColor() {
        XCTAssertEqual(Color.blue, Theme.blue.color)
        XCTAssertEqual(Color.mint, Theme.mint.color)
        XCTAssertEqual(Color.orange, Theme.orange.color)
        XCTAssertEqual(Color.purple, Theme.purple.color)
        XCTAssertEqual(Color.red, Theme.red.color)
        XCTAssertEqual(Color.yellow, Theme.yellow.color)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
