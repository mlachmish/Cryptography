//
//  HMACTests.swift
//  Cryptography
//
//  Created by Matan Lachmish on 27/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest

class HMACTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHMACwMD5Positive1() {
        XCTAssertEqual(
            HMAC.authenticate("", key: "", hashMethod: HashMethod.MD5),
        "74e6f7298a9c2d168935f58c001bad88")
    }

    func testHMACwMD5Positive2() {
        XCTAssertEqual(
            HMAC.authenticate("The quick brown fox jumps over the lazy dog",
                key: "key",
                hashMethod: HashMethod.MD5),
        "80070713463e7749b90c2dc24911e275")
    }

    func testHMACwSHA1Positive1() {
        XCTAssertEqual(
            HMAC.authenticate("", key: "", hashMethod: HashMethod.SHA1),
        "fbdb1d1b18aa6c08324b7d64b71fb76370690e1d")
    }

    func testHMACwSHA1Positive2() {
        XCTAssertEqual(
            HMAC.authenticate("The quick brown fox jumps over the lazy dog",
                key: "key",
                hashMethod: HashMethod.SHA1),
        "de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9")
    }

    func testHMACwSHA224Positive1() {
        XCTAssertEqual(
                HMAC.authenticate("",
                        key: "",
                        hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA224)),
                "5ce14f72894662213e2748d2a6ba234b74263910cedde2f5a9271524")
    }

    func testHMACwSHA224Positive2() {
        XCTAssertEqual(
                HMAC.authenticate("The quick brown fox jumps over the lazy dog",
                        key: "key",
                        hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA224)),
                "88ff8b54675d39b8f72322e65ff945c52d96379988ada25639747e69")
    }

    func testHMACwSHA256Positive1() {
        XCTAssertEqual(
            HMAC.authenticate("",
                key: "",
            hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA256)),
        "b613679a0814d9ec772f95d778c35fc5ff1697c493715653c6c712144292c5ad")
    }

    func testHMACwSHA256Positive2() {
        XCTAssertEqual(
            HMAC.authenticate("The quick brown fox jumps over the lazy dog",
                key: "key",
                hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA256)),
            "f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8")
    }

    func testHMACwSHA384Positive1() {
        XCTAssertEqual(
            HMAC.authenticate("",
                key: "",
                hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA384)),
            // swiftlint:disable line_length
            "6c1f2ee938fad2e24bd91298474382ca218c75db3d83e114b3d4367776d14d3551289e75e8209cd4b792302840234adc")
            // swiftlint:enable line_length
    }

    func testHMACwSHA384Positive2() {
        XCTAssertEqual(
            HMAC.authenticate("The quick brown fox jumps over the lazy dog",
                key: "key",
                hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA384)),
            // swiftlint:disable line_length
            "d7f4727e2c0b39ae0f1e40cc96f60242d5b7801841cea6fc592c5d3e1ae50700582a96cf35e1e554995fe4e03381c237")
            // swiftlint:enable line_length
    }

    func testHMACwSHA512Positive1() {
        XCTAssertEqual(
            HMAC.authenticate("",
                key: "",
                hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA512)),
            // swiftlint:disable line_length
            "b936cee86c9f87aa5d3c6f2e84cb5a4239a5fe50480a6ec66b70ab5b1f4ac6730c6c515421b327ec1d69402e53dfb49ad7381eb067b338fd7b0cb22247225d47")
            // swiftlint:enable line_length
    }

    func testHMACwSHA512Positive2() {
        XCTAssertEqual(
            HMAC.authenticate("The quick brown fox jumps over the lazy dog",
                key: "key",
                hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA512)),
            // swiftlint:disable line_length
            "b42af09057bac1e2d41708e48a902e09b5ff7f12ab428a4fe86653c73dd248fb82f948a549f7b791a5b41915ee4d1ec3935357e4e2317250d0372afa2ebeeb3a")
            // swiftlint:enable line_length
    }

    // Mark: Performance tests
    func testHMACwMD5Performance() {
        self.measureBlock {
            HMAC.authenticate("", key: "",
                hashMethod: HashMethod.MD5)
        }
    }

    func testHMACwSHA1Performance() {
        self.measureBlock {
            HMAC.authenticate("", key: "",
                hashMethod: HashMethod.SHA1)
        }
    }

    func testHMACwSHA256Performance() {
        self.measureBlock {
            HMAC.authenticate("", key: "",
                hashMethod: HashMethod.SHA2(sha2Variant: SHA2Variant.SHA256))
        }
    }
}
