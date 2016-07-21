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
}

public enum MACMethod {
    case HMAC
}

public class Cryptography {

    func hash(message: String, method: HashMethod) -> String {
        switch method {
        case .MD5:
            return MD5.hash(message)
        case .SHA1:
            return SHA1.hash(message)
        }
    }

    func sign(message: String, key: String, hashMethod: HashMethod, method: MACMethod) -> String {
        switch method {
        case .HMAC:
            return HMAC.sign(message, key: key, hashMethod: hashMethod)
        }
    }

}
