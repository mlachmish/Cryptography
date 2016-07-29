//
//  HashProtocol.swift
//  Cryptography
//
//  Created by Matan Lachmish on 10/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

protocol HashProtocol {

    static func hash(message: [UInt8]) -> [UInt8]

    //Convinence method for working with strings
    static func hash(message: String) -> String

}
