//
//  SHA2Tests.swift
//  Cryptography
//
//  Created by Matan Lachmish on 25/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest
@testable import Cryptography

class SHA2Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSHA224Positive1() {
        XCTAssertEqual(SHA2Variant.SHA224.hash(""),
                       "d14a028c2a3a2bc9476102bb288234c415a2b01f828ea62ac5b3e42f",
                       "SHA2-224 test failed")
    }

    func testSHA256Positive1() {
        XCTAssertEqual(SHA2Variant.SHA256.hash(""),
                       "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
                       "SHA2-256 test failed")
    }

    func testSHA384Positive1() {
        XCTAssertEqual(SHA2Variant.SHA384.hash(""),
                       "38b060a751ac96384cd9327eb1b1e36a21fdb71114be0743" +
            "4c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b",
                       "SHA2-384 test failed")
    }

    func testSHA512Positive1() {
        XCTAssertEqual(SHA2Variant.SHA512.hash(""),
                       "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9" +
            "ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e",
                       "SHA2-512 test failed")
    }

    func testSHA512SLASH224Positive1() {
        XCTAssertEqual(SHA2Variant.SHA512SLASH224.hash(""),
                       "6ed0dd02806fa89e25de060c19d3ac86cabb87d6a0ddd05c333b84f4",
                       "SHA2-512/224 test failed")
    }

    func testSHA512SLASH256Positive1() {
        XCTAssertEqual(SHA2Variant.SHA512SLASH256.hash(""),
                       "c672b8d1ef56ed28ab87c3622c5114069bdd3ad7b8f9737498d0c01ecef0967a",
                       "SHA2-512/256 test failed")
    }

    // Mark: Performance tests
    func testPerformanceSHA224() {
        self.measureBlock {
            SHA2Variant.SHA224.hash("")
        }
    }

    func testPerformanceSHA256() {
        self.measureBlock {
            SHA2Variant.SHA256.hash("")
        }
    }

    func testPerformanceSHA384() {
        self.measureBlock {
            SHA2Variant.SHA384.hash("")
        }
    }

    func testPerformanceSHA512() {
        self.measureBlock {
            SHA2Variant.SHA512.hash("")
        }
    }

    func testPerformanceSHA512SLASH224() {
        self.measureBlock {
            SHA2Variant.SHA512SLASH224.hash("")
        }
    }

    func testPerformanceSHA512SLASH256() {
        self.measureBlock {
            SHA2Variant.SHA512SLASH256.hash("")
        }
    }

}
