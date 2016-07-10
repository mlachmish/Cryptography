//
//  Cryptography.swift
//  Cryptography
//
//  Created by Matan Lachmish on 06/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

public class Cryptography {

    func hash(message: String, method: HashMethod) -> String {
        switch method {
        case .MD5:
            return MD5.hash(message)
        case .SHA1:
            return SHA1.hash(message)
        }
    }

}
