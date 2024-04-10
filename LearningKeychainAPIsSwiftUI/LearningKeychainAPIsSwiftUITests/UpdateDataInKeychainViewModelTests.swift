//
//  UpdateDataInKeychainViewModelTests.swift
//  LearningKeychainAPIsSwiftUITests
//
//  Created by Saurabh Verma on 10/04/24.
//

import XCTest
@testable import LearningKeychainAPIsSwiftUI

final class UpdateDataInKeychainViewModelTests: XCTestCase {
    
    var sut: UpdateDataInKeychainViewModel!
    let keychainservices = MockKeychainService()
    
    override func setUp() {
        keychainservices.secure(secret: "secret", of: "user")
        sut = UpdateDataInKeychainViewModel(keychainservice: keychainservices)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_updateKeychainEntry_success() {
        // Existing secret
        XCTAssertEqual("secret", keychainservices.retrieveSecret(for: "user"))
        
        // Update secret
        sut.update(secret: "updated secret", for: "user")
        
        // Test updated secret
        XCTAssertEqual("updated secret", keychainservices.retrieveSecret(for: "user"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
