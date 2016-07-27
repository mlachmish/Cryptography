//
//  ArraySlicerTests.swift
//  Cryptography
//
//  Created by Matan Lachmish on 27/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest
@testable import Cryptography

class ArraySlicerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSplitToChuncksWithChunkSize1() {
        let array: Array<UInt8> = [UInt8(0x01), UInt8(0x01), UInt8(0x01), UInt8(0x01)]
        let slices = array.splitToChuncks(1)
        for slice in slices {
            XCTAssertEqual(slice, [UInt8(0x01)], "splitToChuncks test failed")
        }
    }

    func testSplitToChuncksWithChunkSize2() {
        let array: Array<UInt8> = [UInt8(0x01), UInt8(0x01), UInt8(0x01), UInt8(0x01)]
        let slices = array.splitToChuncks(2)
        for slice in slices {
            XCTAssertEqual(slice, [UInt8(0x01), UInt8(0x01)], "splitToChuncks test failed")
        }

    }

}
