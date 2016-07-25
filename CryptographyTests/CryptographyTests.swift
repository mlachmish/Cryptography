//
//  CryptographyTests.swift
//  Cryptography
//
//  Created by Matan Lachmish on 25/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest
@testable import Cryptography

class CryptographyTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // Test Hash
    func testMD5() {
        XCTAssertEqual(Cryptography.hash("", method: HashMethod.MD5),
                       "d41d8cd98f00b204e9800998ecf8427e",
                       "MD5 sanity failed")
    }

    func testSHA1() {
        XCTAssertEqual(Cryptography.hash("", method: HashMethod.SHA1),
                       "da39a3ee5e6b4b0d3255bfef95601890afd80709",
                       "SHA1 sanity failed")
    }

    // Test MAC
    func testHMACMD5() {
        XCTAssertEqual(Cryptography.sign("", key: "key",
            method: MACMethod.HMAC(hashMethod: HashMethod.MD5)),
                       "",
                       "HMAC-MD5 sanity failed")
    }

    func testHMACSHA1() {
        XCTAssertEqual(Cryptography.sign("", key: "key",
            method: MACMethod.HMAC(hashMethod: HashMethod.SHA1)),
                       "",
                       "HMAC-SHA1 sanity failed")
    }

}
