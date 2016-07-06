//
//  MD5Tests.swift
//  MD5Tests
//
//  Created by Matan Lachmish on 04/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest
@testable import Cryptography

class MD5Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }

    func testPositive1() {
        XCTAssertEqual(MD5.hash(""),
                       "d41d8cd98f00b204e9800998ecf8427e",
                       "MD5 test failed")
    }
    func testPositive2() {
        XCTAssertEqual(MD5.hash("The quick brown fox jumps over the lazy dog"),
                       "9e107d9d372bb6826bd81d3542a419d6",
                       "MD5 test failed")
    }
    func testPositive3() {
        XCTAssertEqual(MD5.hash("The quick brown fox jumps over the lazy dog."),
                       "e4d909c290d0fb1ca068ffaddf22cbd0",
                       "MD5 test failed")
    }
    func testPerformanceExample() {
        self.measureBlock {
            MD5.hash("The quick brown fox jumps over the lazy dog")
        }
    }
}
