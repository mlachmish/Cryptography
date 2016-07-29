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

    func testSHA224() {
        XCTAssertEqual(Cryptography.hash("",
            method: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA224)),
                       "d14a028c2a3a2bc9476102bb288234c415a2b01f828ea62ac5b3e42f",
                       "SHA2-224 sanity failed")
    }

    func testSHA256() {
        XCTAssertEqual(Cryptography.hash("",
            method: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA256)),
                       "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
                       "SHA2-256 sanity failed")
    }

    func testSHA384() {
        XCTAssertEqual(Cryptography.hash("",
            method: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA384)),
                       "38b060a751ac96384cd9327eb1b1e36a21fdb71114be0743" +
            "4c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b",
                       "SHA2-384 sanity failed")
    }

    func testSHA512() {
        XCTAssertEqual(Cryptography.hash("",
            method: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA512)),
                       "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9" +
            "ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e",
                       "SHA2-512 sanity failed")
    }

    func testSHA512SLASH224() {
        XCTAssertEqual(Cryptography.hash("",
            method: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA512SLASH224)),
                       "6ed0dd02806fa89e25de060c19d3ac86cabb87d6a0ddd05c333b84f4",
                       "SHA2-512/224 sanity failed")
    }

    func testSHA512SLASH256() {
        XCTAssertEqual(Cryptography.hash("",
            method: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA512SLASH256)),
                       "c672b8d1ef56ed28ab87c3622c5114069bdd3ad7b8f9737498d0c01ecef0967a",
                       "SHA2-512/256 sanity failed")
    }

    // Test MAC
    func testHMACwMD5Positive1() {
        XCTAssertEqual(Cryptography.authenticate("", key: "",
            method: MACMethod.HMAC(hashMethod: HashMethod.MD5)),
                       "74e6f7298a9c2d168935f58c001bad88")
    }

    func testHMACwSHA1Positive1() {
        XCTAssertEqual(Cryptography.authenticate("", key: "",
            method: MACMethod.HMAC(hashMethod: HashMethod.SHA1)),
                       "fbdb1d1b18aa6c08324b7d64b71fb76370690e1d")
    }

    func testHMACwSHA256Positive1() {
        XCTAssertEqual(Cryptography.authenticate("", key: "",
            method: MACMethod.HMAC(hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA256))),
                       "b613679a0814d9ec772f95d778c35fc5ff1697c493715653c6c712144292c5ad")
    }

    func testHMACwSHA384Positive1() {
        XCTAssertEqual(
            Cryptography.authenticate("",
                key: "",
                method: MACMethod.HMAC(hashMethod:HashMethod.SHA2(sha2Variant:SHA2Variant.SHA384))),
            // swiftlint:disable line_length
            "6c1f2ee938fad2e24bd91298474382ca218c75db3d83e114b3d4367776d14d3551289e75e8209cd4b792302840234adc")
            // swiftlint:enable line_length
    }

    func testHMACwSHA512Positive1() {
        XCTAssertEqual(
            Cryptography.authenticate("",
                key: "",
                method: MACMethod.HMAC(hashMethod:HashMethod.SHA2(sha2Variant:SHA2Variant.SHA512))),
            // swiftlint:disable line_length
            "b936cee86c9f87aa5d3c6f2e84cb5a4239a5fe50480a6ec66b70ab5b1f4ac6730c6c515421b327ec1d69402e53dfb49ad7381eb067b338fd7b0cb22247225d47")
            // swiftlint:enable line_length
    }

}
