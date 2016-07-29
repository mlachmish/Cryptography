//
//  Cryptography.swift
//  Cryptography
//
//  Created by Matan Lachmish on 06/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

// MARK: hash functions
typealias MD5Impl = MD5
typealias SHA1Impl = SHA1
typealias SHA2Impl = SHA2

/**
 Hash Methods.
 */
public enum HashMethod {
    /**
     The MD5 Message-Digest Algorithm.
     https://tools.ietf.org/html/rfc1321
     */
    case MD5

    /**
     US Secure Hash Algorithm 1 (SHA1).
     https://tools.ietf.org/html/rfc3174
     */
    case SHA1

    /**
     US Secure Hash Algorithm 2 (SHA2).
     https://tools.ietf.org/html/rfc6234

     - Parameter sha2Variant: SHA-2 variants: 224, 256, 284, 512, 512/224, 512/256.
     */
    case SHA2(sha2Variant: SHA2Variant)

    private func hash(message: [UInt8]) -> [UInt8] {
        switch self {
        case .MD5:
            return MD5Impl.hash(message)
        case .SHA1:
            return SHA1Impl.hash(message)
        case .SHA2(let sha2Variant):
            return sha2Variant.hash(message)
        }
    }

    private func hash(message: String) -> String {
        switch self {
        case .MD5:
            return MD5Impl.hash(message)
        case .SHA1:
            return SHA1Impl.hash(message)
        case .SHA2(let sha2Variant):
            return sha2Variant.hash(message)
        }
    }
}

// MARK: message authentication codes
typealias HMACImpl = HMAC

/**
 Message Authentication Codes (MAC).
 */
public enum MACMethod {
    /**
     HMAC: Keyed-Hashing for Message Authentication.
     https://www.ietf.org/rfc/rfc2104

     - Parameter hashMethod: The hash method that sould be used
     in the HMAC algorithm (see @HashMethod).
     */
    case HMAC(hashMethod: HashMethod)

    private func authenticate(message: [UInt8], key: [UInt8]) -> [UInt8] {
        switch self {
        case .HMAC(let hashMethod):
            return HMACImpl.authenticate(message, key: key, hashMethod: hashMethod)
        }
    }

    private func authenticate(message: String, key: String) -> String {
        switch self {
        case .HMAC(let hashMethod):
            return HMACImpl.authenticate(message, key: key, hashMethod: hashMethod)
        }
    }
}

/**
    Public facade,
    This is the single entry point to the entire framework.
*/
public struct Cryptography {

    /**
     Calculate hash function.

     - Parameter message: The message that should be hashed, formatted as **Byte Array**.
     - parameter method: The Hash Method.

     - Returns: The calculated hash value.
    */
    static func hash(message: [UInt8], method: HashMethod) -> [UInt8] {
        return method.hash(message)
    }

    /**
    Calculate hash function.

    - parameter message: The message that should be hashed, formatted as **String**.
    - parameter method: The Hash Method.

    - returns: The calculated hash value.
    */
    static func hash(message: String, method: HashMethod) -> String {
        return method.hash(message)
    }

    /**
    Calculate message authentication code (MAC).

    - parameter message: The message that should be authenticated, formatted as **Byte Array**.
    - parameter key: The key which should be used, formatted as **Byte Array**.
    - parameter method: The Hash Method.

    - returns: The calculated code value.
    */
    static func authenticate(message: [UInt8], key: [UInt8], method: MACMethod) -> [UInt8] {
        return method.authenticate(message, key: key)
    }

    /**
    Calculate message authentication code (MAC).

    - parameter message: The message that should be authenticated, formatted as **String**.
    - parameter key: The key which should be used, formatted as **String**.
    - parameter method: The Hash Method.

    - returns: The calculated code value.
    */
    static func authenticate(message: String, key: String, method: MACMethod) -> String {
        return method.authenticate(message, key: key)
    }

}
