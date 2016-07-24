//
//  Representations.swift
//  Cryptography
//
//  Created by Matan Lachmish on 05/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

class Representations {

    // Array of bytes with optional padding (little-endian)
    static func toUInt8Array<T>(value: T, length: Int? = nil) -> Array<UInt8> {
        let totalBytes = length ?? sizeof(T)
        var copyOfValue = value

        return withUnsafePointer(&copyOfValue) {
            Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>($0), count: totalBytes)).reverse()
        }
    }

    // Merge Array of UInt8 to array of UInt32
    static func mergeToUInt32Array(slice: ArraySlice<UInt8>) -> Array<UInt32> {
        var result = Array<UInt32>()
        result.reserveCapacity(16)

        for idx in slice.startIndex.stride(to: slice.endIndex, by: sizeof(UInt32)) {
            let val1: UInt32 = UInt32(slice[idx.advancedBy(3)]) << 24
            let val2: UInt32 = UInt32(slice[idx.advancedBy(2)]) << 16
            let val3: UInt32 = UInt32(slice[idx.advancedBy(1)]) << 8
            let val4: UInt32 = UInt32(slice[idx])
            let val: UInt32 = val1 | val2 | val3 | val4
            result.append(val)
        }

        return result
    }

    // Return hexadecimal string representation of Array<UInt8>
    static func toHexadecimalString(bytes: Array<UInt8>) -> String {
        var hexString = String()
        for byte in bytes {
            hexString = hexString.stringByAppendingFormat("%02x", byte)
        }

        return hexString
    }

}
