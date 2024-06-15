//
//  BikesViewModelTests.swift
//  LearningAppSwiftDataTests
//
//  Created by Saurabh Verma on 15/06/24.
//

import XCTest
@testable import LearningAppSwiftData

final class BikesViewModelTests: XCTestCase {

    func test_bikeViewModel_noBikesInGarage() {
        let bikeViewModel = BikesViewModel()
        XCTAssertEqual(0, bikeViewModel.bikesInGarage().count)
    }
    
    func test_bikeViewModel_addBikes() {
        let bikeViewModel = BikesViewModel()
        let bike = Bike(name: "Duke 390", company: "KTM", cubicCapacity: 390)
        bikeViewModel.add(bike: bike)
        XCTAssertEqual(1, bikeViewModel.bikesInGarage().count)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
