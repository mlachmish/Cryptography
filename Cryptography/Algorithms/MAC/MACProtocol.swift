//
//  MACProtocol.swift
//  Cryptography
//
//  Created by Matan Lachmish on 10/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

protocol MACProtocol {

    static func authenticate(message: [UInt8], key: [UInt8], hashMethod: HashMethod) -> [UInt8]

    //Convinence method for working with strings
    static func authenticate(message: String, key: String, hashMethod: HashMethod) -> String

}
