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

    // Mark: UInt32
    func testUInt32RotateLeft() {
        let val1 = 0x00000001 as UInt32
        XCTAssertEqual(val1.rotateLeft(0x00000001), 0x00000002, "Rotation test failed")
        XCTAssertEqual(val1.rotateLeft(0x00000002), 0x00000004, "Rotation test failed")

        let val2 = 0x00000005 as UInt32
        XCTAssertEqual(val2.rotateLeft(0x00000001), 0x0000000a, "Rotation test failed")
        XCTAssertEqual(val2.rotateLeft(0x00000002), 0x00000014, "Rotation test failed")
    }

    func testUInt32RotateRight() {
        let val1 = 0x00000001 as UInt32
        XCTAssertEqual(val1.rotateRight(0x00000001), 0x80000000, "Rotation test failed")
        XCTAssertEqual(val1.rotateRight(0x00000002), 0x40000000, "Rotation test failed")

        let val2 = 0x00000005 as UInt32
        XCTAssertEqual(val2.rotateRight(0x00000001), 0x80000002, "Rotation test failed")
        XCTAssertEqual(val2.rotateRight(0x00000002), 0x40000001, "Rotation test failed")
    }

    func testUInt32ReverseBytes() {
        let val1 = 0x00000001 as UInt32
        XCTAssertEqual(val1.reverseBytes(), 0x01000000, "Reverse test failed")

        let val2 = 0x01000001 as UInt32
        XCTAssertEqual(val2.reverseBytes(), val2, "Reverse test failed")
    }

    // Mark: UInt64
    func testUInt64RotateLeft() {
        let val1 = 0x0000000000000001 as UInt64
        XCTAssertEqual(val1.rotateLeft(0x0000000000000001), 0x0000000000000002,
                       "Rotation test failed")
        XCTAssertEqual(val1.rotateLeft(0x0000000000000002), 0x0000000000000004,
                       "Rotation test failed")

        let val2 = 0x0000000000000005 as UInt64
        XCTAssertEqual(val2.rotateLeft(0x0000000000000001), 0x000000000000000a,
                       "Rotation test failed")
        XCTAssertEqual(val2.rotateLeft(0x0000000000000002), 0x0000000000000014,
                       "Rotation test failed")
    }

    func testUInt64RotateRight() {
        let val1 = 0x0000000000000001 as UInt64
        XCTAssertEqual(val1.rotateRight(0x0000000000000001), 0x8000000000000000,
                       "Rotation test failed")
        XCTAssertEqual(val1.rotateRight(0x0000000000000002), 0x4000000000000000,
                       "Rotation test failed")

        let val2 = 0x0000000000000005 as UInt64
        XCTAssertEqual(val2.rotateRight(0x0000000000000001), 0x8000000000000002,
                       "Rotation test failed")
        XCTAssertEqual(val2.rotateRight(0x0000000000000002), 0x4000000000000001,
                       "Rotation test failed")
    }

    func testUInt64ReverseBytes() {
        let val1 = 0x0000000000000001 as UInt64
        XCTAssertEqual(val1.reverseBytes(), 0x0100000000000000, "Reverse test failed")

        let val2 = 0x0100000000000001 as UInt64
        XCTAssertEqual(val2.reverseBytes(), val2, "Reverse test failed")
    }

}
