//
// Created by Matan Lachmish on 06/07/2016.
// Copyright (c) 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest
@testable import Cryptography

class ArithmeticsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRotateLeft() {
        let val1 = 0x00000001 as UInt32
        XCTAssertEqual(val1.rotateLeft(0x00000001), 0x00000002, "Rotation test failed")
        XCTAssertEqual(val1.rotateLeft(0x00000002), 0x00000004, "Rotation test failed")
        let val2 = 0x00000005 as UInt32
        XCTAssertEqual(val2.rotateLeft(0x00000001), 0x0000000a, "Rotation test failed")
        XCTAssertEqual(val2.rotateLeft(0x00000002), 0x00000014, "Rotation test failed")
    }
    func testRotateRight() {
        let val1 = 0x00000001 as UInt32
        XCTAssertEqual(val1.rotateRight(0x00000001), 0x80000000, "Rotation test failed")
        XCTAssertEqual(val1.rotateRight(0x00000002), 0x40000000, "Rotation test failed")
        let val2 = 0x00000005 as UInt32
        XCTAssertEqual(val2.rotateRight(0x00000001), 0x80000002, "Rotation test failed")
        XCTAssertEqual(val2.rotateRight(0x00000002), 0x40000001, "Rotation test failed")
    }
    func testReverseBytes() {
        let val1 = 0x00000001 as UInt32
        XCTAssertEqual(val1.reverseBytes(), 0x01000000, "Reverse test failed")
        let val2 = 0x01000001 as UInt32
        XCTAssertEqual(val2.reverseBytes(), val2, "Reverse test failed")
    }

}
