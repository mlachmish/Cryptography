//
//  Array+SequenceGenerator.swift
//  Cryptography
//
//  Created by Matan Lachmish on 05/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

extension Array {
   
    public func splitToChuncks(chunkSize: Int) -> AnyGenerator<ArraySlice<Element>> {
        
        var offset: Int = 0
        
        return AnyGenerator {
            let end = min(chunkSize, self.count - offset)
            let result = self[offset..<offset + end]
            offset += result.count
            return !result.isEmpty ? result : nil
        }
    }

}