//
//  Representations.swift
//  Cryptography
//
//  Created by Matan Lachmish on 05/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

extension Int {
    
    public func bytesRepresentation(totalBytes: Int = sizeof(Int)) -> Array<UInt8> {
        return toByteArray(self, length: totalBytes)
    }
    
    //Array of bytes with optional padding (little-endian)
    func toByteArray<T>(value: T, length:Int? = nil) -> [UInt8] {
        let totalBytes = length ?? sizeof(T)
        
        var copyOfValue = value
        return withUnsafePointer(&copyOfValue) {
            Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>($0), count: totalBytes)).reverse()
        }
    }
}