//
//  RetrieveDataFromKeychainViewModelTests.swift
//  LearningKeychainAPIsSwiftUITests
//
//  Created by Saurabh Verma on 10/04/24.
//

import XCTest
@testable import LearningKeychainAPIsSwiftUI

final class RetrieveDataFromKeychainViewModelTests: XCTestCase {
    
    var sut: RetrieveDataFromKeychainViewModel!
    let keychainservices = MockKeychainService()
    
    override func setUp() {
        keychainservices.secure(secret: "secret", of: "user")
        sut = RetrieveDataFromKeychainViewModel(keychainService: keychainservices)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_retrieveFromKeychain_success() throws {
        XCTAssertEqual("secret", sut.retrieveSecret(of: "user"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
