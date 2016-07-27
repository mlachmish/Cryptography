//
// Created by Matan Lachmish on 06/07/2016.
// Copyright (c) 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest
@testable import Cryptography

class AccessorsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: UInt32 accessors
    func testUInt32FirstByte() {
        let val1 = 0xA5C964F2 as UInt32
        XCTAssertEqual(val1.firstByte, 0xF2, "Accessors test failed")
    }

    func testUInt32SecondByte() {
        let val1 = 0xA5C964F2 as UInt32
        XCTAssertEqual(val1.secondByte, 0x64, "Accessors test failed")
    }

    func testUInt32ThirdByte() {
        let val1 = 0xA5C964F2 as UInt32
        XCTAssertEqual(val1.thirdByte, 0xC9, "Accessors test failed")
    }

    func testUInt32FourthByte() {
        let val1 = 0xA5C964F2 as UInt32
        XCTAssertEqual(val1.fourthByte, 0xA5, "Accessors test failed")
    }

    // MARK: UInt64 accessors
    func testUInt64FirstByte() {
        let val1 = 0xA5C964F25A810FE9 as UInt64
        XCTAssertEqual(val1.firstByte, 0xE9, "Accessors test failed")
    }

    func testUInt64SecondByte() {
        let val1 = 0xA5C964F25A810FE9 as UInt64
        XCTAssertEqual(val1.secondByte, 0x0F, "Accessors test failed")
    }

    func testUInt64ThirdByte() {
        let val1 = 0xA5C964F25A810FE9 as UInt64
        XCTAssertEqual(val1.thirdByte, 0x81, "Accessors test failed")
    }

    func testUInt64FourthByte() {
        let val1 = 0xA5C964F25A810FE9 as UInt64
        XCTAssertEqual(val1.fourthByte, 0x5A, "Accessors test failed")
    }

    func testUInt64FifthByte() {
        let val1 = 0xA5C964F25A810FE9 as UInt64
        XCTAssertEqual(val1.fifthByte, 0xF2, "Accessors test failed")
    }

    func testUInt64SixthByte() {
        let val1 = 0xA5C964F25A810FE9 as UInt64
        XCTAssertEqual(val1.sixthByte, 0x64, "Accessors test failed")
    }

    func testUInt64SeventhByte() {
        let val1 = 0xA5C964F25A810FE9 as UInt64
        XCTAssertEqual(val1.seventhByte, 0xC9, "Accessors test failed")
    }

    func testUInt64EightthByte() {
        let val1 = 0xA5C964F25A810FE9 as UInt64
        XCTAssertEqual(val1.eighthByte, 0xA5, "Accessors test failed")
    }

}
