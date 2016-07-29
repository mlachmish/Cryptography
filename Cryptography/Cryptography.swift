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
public enum HashMethod {
    case MD5
    case SHA1
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
public enum MACMethod {
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

// MARK: Public facade
public struct Cryptography {

    static func hash(message: [UInt8], method: HashMethod) -> [UInt8] {
        return method.hash(message)
    }

    static func hash(message: String, method: HashMethod) -> String {
        return method.hash(message)
    }

    static func authenticate(message: [UInt8], key: [UInt8], method: MACMethod) -> [UInt8] {
        return method.authenticate(message, key: key)
    }

    static func authenticate(message: String, key: String, method: MACMethod) -> String {
        return method.authenticate(message, key: key)
    }

}
