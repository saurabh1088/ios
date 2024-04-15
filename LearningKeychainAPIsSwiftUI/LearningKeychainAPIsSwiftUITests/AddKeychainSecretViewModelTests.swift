//
//  AddKeychainSecretViewModelTests.swift
//  LearningKeychainAPIsSwiftUITests
//
//  Created by Saurabh Verma on 10/04/24.
//

import XCTest
@testable import LearningKeychainAPIsSwiftUI

final class AddKeychainSecretViewModelTests: XCTestCase {
    
    var sut: AddKeychainSecretViewModel!
    let keychainservices = MockKeychainService()
    
    override func setUp() {
        sut = AddKeychainSecretViewModel(keychainService: keychainservices)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_addToKeychain_success() {
        sut.addSecret("new secret", of: "new user")
        
        XCTAssertEqual("new secret", keychainservices.retrieveSecret(for: "new user"))
    }
    
    func test_addToKeychainWithSecureOption_success() {
        sut.accessShouldDemandUserPresence()
        sut.addSecret("secure secret", of: "secure user")
        
        XCTAssertEqual("secure secret", keychainservices.retrieveSecret(for: "secure user"))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            sut.addSecret("new secret", of: "new user")
        }
    }

}
