//
//  ImageCacheTests.swift
//  LearningAppCacheSwiftUIUnitTests
//
//  Created by Saurabh Verma on 19/11/26.
//


import XCTest
import UIKit
@testable import LearningAppCacheSwiftUI

final class ImageCacheTests: XCTestCase {

    var sut: ImageCache!

    override func setUp() {
        super.setUp()
        sut = ImageCache()
    }

    override func tearDown() {
        sut.clearCache()
        sut = nil
        super.tearDown()
    }

    func testInsertAndRetrieveImage() {

        let image = makeTestImage()

        sut.insert(image, forKey: "test-image")

        let retrievedImage = sut.image(forKey: "test-image")

        XCTAssertNotNil(retrievedImage)
    }

    func testRetrieveNonExistingImage() {

        let result = sut.image(forKey: "unknown")

        XCTAssertNil(result)
    }

    func testRemoveImage() {

        let image = makeTestImage()

        sut.insert(image, forKey: "test-image")
        sut.removeImage(forKey: "test-image")

        XCTAssertNil(sut.image(forKey: "test-image"))
    }

    func testClearCache() {

        sut.insert(makeTestImage(), forKey: "image-1")
        sut.insert(makeTestImage(), forKey: "image-2")

        sut.clearCache()

        XCTAssertNil(sut.image(forKey: "image-1"))
        XCTAssertNil(sut.image(forKey: "image-2"))
    }
    
    func testCacheCountLimit() {
        sut.insert(makeTestImage(), forKey: "image-1")
        sut.insert(makeTestImage(), forKey: "image-2")
        sut.insert(makeTestImage(), forKey: "image-3")
        sut.insert(makeTestImage(), forKey: "image-4")
        sut.insert(makeTestImage(), forKey: "image-5")
        sut.insert(makeTestImage(), forKey: "image-6")
        sut.insert(makeTestImage(), forKey: "image-7")
        sut.insert(makeTestImage(), forKey: "image-8")
        sut.insert(makeTestImage(), forKey: "image-9")
        sut.insert(makeTestImage(), forKey: "image-10")
        sut.insert(makeTestImage(), forKey: "image-11")
        
        XCTAssertNil(sut.image(forKey: "image-1"))
        XCTAssertNotNil(sut.image(forKey: "image-2"))
        XCTAssertNotNil(sut.image(forKey: "image-3"))
        XCTAssertNotNil(sut.image(forKey: "image-4"))
        XCTAssertNotNil(sut.image(forKey: "image-5"))
        XCTAssertNotNil(sut.image(forKey: "image-6"))
        XCTAssertNotNil(sut.image(forKey: "image-7"))
        XCTAssertNotNil(sut.image(forKey: "image-8"))
        XCTAssertNotNil(sut.image(forKey: "image-9"))
        XCTAssertNotNil(sut.image(forKey: "image-10"))
        XCTAssertNotNil(sut.image(forKey: "image-11"))
    }

    private func makeTestImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(
            size: CGSize(width: 100, height: 100)
        )

        return renderer.image { context in
            UIColor.red.setFill()
            context.fill(
                CGRect(x: 0, y: 0, width: 100, height: 100)
            )
        }
    }
}
