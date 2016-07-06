//
//  Accessors.swift
//  Cryptography
//
//  Created by Matan Lachmish on 06/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

extension UInt32 {

    var firstByte: UInt8 {
        return UInt8(self & 0xff)
    }

    var secondByte: UInt8 {
        return UInt8((self >> 8) & 0xff)
    }

    var thirdByte: UInt8 {
        return UInt8((self >> 16) & 0xff)
    }

    var fourthByte: UInt8 {
        return UInt8((self >> 24) & 0xff)
    }

}
