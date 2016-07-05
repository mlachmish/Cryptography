//
//  UInt+Arithmetics.swift
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
    
}