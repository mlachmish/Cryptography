//
//  MACProtocol.swift
//  Cryptography
//
//  Created by Matan Lachmish on 10/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

protocol MACProtocol {

    static func sign(message: String, key: String, hashMethod: HashMethod) -> String

}
