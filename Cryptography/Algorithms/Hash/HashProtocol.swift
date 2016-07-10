//
//  HashProtocol.swift
//  Cryptography
//
//  Created by Matan Lachmish on 10/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

enum HashMethod {
    case MD5
    case SHA1
}

protocol HashProtocol {

    static func hash(message: String) -> String

}
