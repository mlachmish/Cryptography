//
//  SHA1Tests.swift
//  Cryptography
//
//  Created by Matan Lachmish on 07/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest

class SHA1Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPositive1() {
        XCTAssertEqual(SHA1.hash(""),
                       "da39a3ee5e6b4b0d3255bfef95601890afd80709",
                       "SHA1 test failed")
    }

    func testPositive2() {
        XCTAssertEqual(SHA1.hash("The quick brown fox jumps over the lazy dog"),
                       "2fd4e1c67a2d28fced849ee1bb76e7391b93eb12",
                       "SHA1 test failed")
    }

    func testPositive3() {
        XCTAssertEqual(SHA1.hash("The quick brown fox jumps over the lazy dog."),
                       "408d94384216f890ff7a0c3528e8bed1e0b01621",
                       "SHA1 test failed")
    }

    // Mark: Performance tests
    func testPerformanceExample() {
        self.measureBlock {
            SHA1.hash("The quick brown fox jumps over the lazy dog")
        }
    }

}
