//
//  CryptographyTests.swift
//  CryptographyTests
//
//  Created by Matan Lachmish on 04/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest
@testable import Cryptography

class MD5Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPositive1() {
        let expected = [0xd4, 0x1d, 0x8c, 0xd9, 0x8f ,0x00 ,0xb2 ,0x04 ,0xe9 ,0x80 ,0x09 ,0x98 ,0xec ,0xf8 ,0x42 ,0x7e] as Array<UInt8>
        XCTAssertEqual(MD5.digest(""), expected, "Bad digest")
    }
    
    func testPositive2() {
        let expected = [0x9e, 0x10, 0x7d, 0x9d, 0x37, 0x2b, 0xb6, 0x82, 0x6b, 0xd8, 0x1d, 0x35, 0x42, 0xa4, 0x19, 0xd6] as Array<UInt8>
        XCTAssertEqual(MD5.digest("The quick brown fox jumps over the lazy dog"), expected, "Bad digest")
    }
    
    func testPositive3() {
        let expected = [0xe4, 0xd9, 0x09, 0xc2, 0x90, 0xd0, 0xfb, 0x1c, 0xa0, 0x68, 0xff, 0xad, 0xdf, 0x22, 0xcb, 0xd0] as Array<UInt8>
        XCTAssertEqual(MD5.digest("The quick brown fox jumps over the lazy dog."), expected, "Bad digest")
    }
    
    func testPerformanceExample() {
        self.measureBlock {
            MD5.digest("The quick brown fox jumps over the lazy dog")
        }
    }
    
}
