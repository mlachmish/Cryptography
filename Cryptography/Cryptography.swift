//
//  Cryptography.swift
//  Cryptography
//
//  Created by Matan Lachmish on 06/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

public enum HashMethod {
    case MD5
    case SHA1
    case SHA2(sha2Variant: SHA2Variant)
}

public enum MACMethod {
    case HMAC(hashMethod: HashMethod)
}

public class Cryptography {

    static func hash(message: String, method: HashMethod) -> String {
        switch method {
        case .MD5:
            return MD5.hash(message)
        case .SHA1:
            return SHA1.hash(message)
        case .SHA2(let sha2Variant):
            return sha2Variant.hash(message)
        }
    }

    static func sign(message: String, key: String, method: MACMethod) -> String {
        switch method {
        case .HMAC(let hashMethod):
            return HMAC.sign(message, key: key, hashMethod: hashMethod)
        }
    }

}
