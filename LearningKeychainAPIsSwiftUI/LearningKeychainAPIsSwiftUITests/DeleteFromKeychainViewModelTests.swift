//
//  DeleteFromKeychainViewModelTests.swift
//  LearningKeychainAPIsSwiftUITests
//
//  Created by Saurabh Verma on 10/04/24.
//

import XCTest
@testable import LearningKeychainAPIsSwiftUI

final class DeleteFromKeychainViewModelTests: XCTestCase {
    
    var sut: DeleteFromKeychainViewModel!
    var keychainservice = MockKeychainService()
    
    override func setUp() {
        sut = DeleteFromKeychainViewModel(keychainservice: keychainservice)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_deleteFromKeychain_success() {
        keychainservice.secure(secret: "secret", of: "user")
        
        sut.delete(user: "user")
        
        XCTAssertEqual(nil, keychainservice.retrieveSecret(for: "user"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
