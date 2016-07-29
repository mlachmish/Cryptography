//
//  HMAC.swift
//  Cryptography
//
//  Created by Matan Lachmish on 10/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation


internal struct HMAC: MACProtocol {

    static private func blockSize(hashMethod: HashMethod) -> Int {

        switch hashMethod {
        case .MD5:
            return MD5.blockSize
        case .SHA1:
            return SHA1.blockSize
        case .SHA2(let sha2Variant):
            switch sha2Variant {
            case .SHA224, .SHA256:
                return sha2Variant.blockSize
            case .SHA384, .SHA512, .SHA512SLASH224, .SHA512SLASH256:
                return sha2Variant.blockSize
            }
        }

    }

    static private func preprocessKey(key: Array<UInt8>,
                              blockSize: Int,
                              hashMethod: HashMethod) -> Array<UInt8> {

        if key.count > blockSize { // keys longer than blocksize are shortened
            let keyAsString = Representations.toHexadecimalString(key)
            let hashedKey = Cryptography.hash(keyAsString, method: hashMethod)
            return Representations.toUInt8Array(hashedKey)
        }

        if key.count < blockSize { // keys shorter than blocksize are zero-padded
            return key + Array<UInt8>(count: blockSize - key.count, repeatedValue: 0)
        }

        return key
    }

    static func authenticate(message: [UInt8], key: [UInt8], hashMethod: HashMethod) -> [UInt8] {
        let preprocessedKey = HMAC.preprocessKey(key,
                                                 blockSize: self.blockSize(hashMethod),
                                                 hashMethod: hashMethod)

        var opad = Array<UInt8>(count: self.blockSize(hashMethod), repeatedValue: 0x5c)
        for (idx, _) in preprocessedKey.enumerate() {
            opad[idx] = preprocessedKey[idx] ^ opad[idx]
        }
        var ipad = Array<UInt8>(count: self.blockSize(hashMethod), repeatedValue: 0x36)
        for (idx, _) in preprocessedKey.enumerate() {
            ipad[idx] = preprocessedKey[idx] ^ ipad[idx]
        }

        let ipadAndMessageHash = Cryptography.hash(ipad + message, method: hashMethod)
        return Cryptography.hash(opad + ipadAndMessageHash, method: hashMethod)
    }

    static func authenticate(message: String, key: String, hashMethod: HashMethod) -> String {
        return Representations.toHexadecimalString(
            self.authenticate(Array(message.utf8), key: Array(key.utf8), hashMethod: hashMethod)
        )
    }

}
