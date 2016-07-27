//
//  RepresentationsTests.swift
//  Cryptography
//
//  Created by Matan Lachmish on 27/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest
@testable import Cryptography

class RepresentationsTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testToUInt8Array() {
        let expectedValue = [UInt8(0x00), UInt8(0x00), UInt8(0x00), UInt8(0x00),
                             UInt8(0x00), UInt8(0x00), UInt8(0x00), UInt8(0x40)]
        XCTAssertEqual(Representations.toUInt8Array(64), expectedValue)
    }

    func testMergeToUInt32Array() {
        XCTAssertEqual(Representations.mergeToUInt32Array(
            [UInt8(0x01), UInt8(0x01), UInt8(0x01), UInt8(0x01),
            UInt8(0x01), UInt8(0x01), UInt8(0x01), UInt8(0x01)]),
            [UInt32(0x01010101), UInt32(0x01010101)])
    }

    func testMergeToUInt64Array() {
        XCTAssertEqual(Representations.mergeToUInt64Array(
            [UInt8(0x01), UInt8(0x01), UInt8(0x01), UInt8(0x01),
            UInt8(0x01), UInt8(0x01), UInt8(0x01), UInt8(0x01),
            UInt8(0x01), UInt8(0x01), UInt8(0x01), UInt8(0x01),
            UInt8(0x01), UInt8(0x01), UInt8(0x01), UInt8(0x01)]),
            [UInt64(0x0101010101010101), UInt64(0x0101010101010101)])
    }

    func testToHexadecimalString() {
        XCTAssertEqual(Representations.toHexadecimalString(
            [UInt8(0x01), UInt8(0x01), UInt8(0x01), UInt8(0x01)]),
            "01010101")
    }

}
