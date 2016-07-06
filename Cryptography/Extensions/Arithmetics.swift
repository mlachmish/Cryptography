//
//  Arithmetics.swift
//  Cryptography
//
//  Created by Matan Lachmish on 05/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

extension UInt32 {

    public func rotateLeft(n:UInt32) -> UInt32 {
        return ((self << n) & 0xFFFFFFFF) | (self >> (32 - n))
    }

    public func rotateRight(n:UInt32) -> UInt32 {
        return (self >> n) | (self << (32 - n))
    }

    func reverseBytes() -> UInt32 {
        let tmp1 = ((self & 0x000000FF) << 24) | ((self & 0x0000FF00) << 8)
        let tmp2 = ((self & 0x00FF0000) >> 8)  | ((self & 0xFF000000) >> 24)
        return tmp1 | tmp2
    }
    
}