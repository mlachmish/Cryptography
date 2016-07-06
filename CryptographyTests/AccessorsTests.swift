//
// Created by Matan Lachmish on 06/07/2016.
// Copyright (c) 2016 The Big Fat Ninja. All rights reserved.
//

import XCTest
@testable import Cryptography

class AccessorsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFirstByte() {
        let val1 = 0xA5C964F2 as UInt32
        XCTAssertEqual(val1.firstByte, 0xF2, "Accessors test failed")
    }
    
    func testSecondByte() {
        let val1 = 0xA5C964F2 as UInt32
        XCTAssertEqual(val1.secondByte, 0x64, "Accessors test failed")
    }
    
    func testThirdByte() {
        let val1 = 0xA5C964F2 as UInt32
        XCTAssertEqual(val1.thirdByte, 0xC9, "Accessors test failed")
    }
    
    func testFourthByte() {
        let val1 = 0xA5C964F2 as UInt32
        XCTAssertEqual(val1.fourthByte, 0xA5, "Accessors test failed")
    }

}
