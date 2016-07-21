//
//  SHA1.swift
//  Cryptography
//
//  Created by Matan Lachmish on 07/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

private struct SHA1Constants {
    static let messageLengthBits = 64
}

internal class SHA1: HashProtocol {

    private static func preprocessMessage(message: Array<UInt8>) -> Array<UInt8> {
        var preprocessedMessage = message
        //Pre-processing: adding a single 1 bit
        //Notice: the input bytes are considered as bits strings,
        //where the first bit is the most significant bit of the byte.
        preprocessedMessage.append(0x80)

        //Pre-processing: padding with zeros
        //append "0" bit until message length in bits ≡ 448 (mod 512)
        let desiredMessageLengthModulo = (SHA1Constants.messageLengthBits - 8)
        var messageLength = preprocessedMessage.count
        var paddingCounter = 0
        while messageLength % SHA1Constants.messageLengthBits != desiredMessageLengthModulo {
            paddingCounter += 1
            messageLength += 1
        }
        preprocessedMessage += Array<UInt8>(count: paddingCounter, repeatedValue: 0)
        //append original length in bits mod (2 pow 64) to message
        preprocessedMessage.reserveCapacity(preprocessedMessage.count + 4)
        let lengthInBits = (message.count * 8)
        let lengthBytes = Representations.toUInt8Array(lengthInBits, length: 64/8)
        preprocessedMessage += lengthBytes
        return preprocessedMessage
    }

    // swiftlint:disable function_body_length
    static func hash(message: String) -> String {
        //Initialize variables:
        var a0 = UInt32(0x67452301)   //A
        var b0 = UInt32(0xefcdab89)   //B
        var c0 = UInt32(0x98badcfe)   //C
        var d0 = UInt32(0x10325476)   //D
        var e0 = UInt32(0xC3D2E1F0)   //E

        //Pre-processing
        let preprocessedMessage = preprocessMessage(Array(message.utf8))

        //Process the message in successive 512-bit chunks:
        let chunkSizeBytes = 512 / 8
        for chunk in preprocessedMessage.splitToChuncks(chunkSizeBytes) {
            //break chunk into sixteen 32-bit big-endian words w[i], 0 ≤ i ≤ 15
            //Extend the sixteen 32-bit words into eighty 32-bit words:
            var M: Array<UInt32> = Array<UInt32>(count: 80, repeatedValue: 0)

            for x in 0..<M.count {
                switch x {
                case 0...15:
                    let start = chunk.startIndex + (x * sizeofValue(M[x]))
                    let end = start + sizeofValue(M[x])
                    let le = Representations.mergeToUInt32Array(chunk[start..<end])[0]
                    M[x] = le.bigEndian
                    break
                default:
                    M[x] = (M[x-3] ^ M[x-8] ^ M[x-14] ^ M[x-16]).rotateLeft(1)
                    break
                }
            }

            //Initialize hash value for this chunk:
            var A = a0
            var B = b0
            var C = c0
            var D = d0
            var E = e0

            //Main loop:
            for i in 0...79 {
                var f: UInt32 = 0
                var k: UInt32 = 0

                switch i {
                case 0...19:
                    f = (B & C) | ((~B) & D)
                    k = 0x5A827999
                    break
                case 20...39:
                    f = B ^ C ^ D
                    k = 0x6ED9EBA1
                    break
                case 40...59:
                    f = (B & C) | (B & D) | (C & D)
                    k = 0x8F1BBCDC
                    break
                case 60...79:
                    f = B ^ C ^ D
                    k = 0xCA62C1D6
                    break
                default:
                    break
                }

                let temp = (A.rotateLeft(5) &+ f &+ E &+ M[i] &+ k) & 0xffffffff
                E = D
                D = C
                C = B.rotateLeft(30)
                B = A
                A = temp
            }

            //Add this chunk's hash to result so far:
            a0 = (a0 &+ A)
            b0 = (b0 &+ B)
            c0 = (c0 &+ C)
            d0 = (d0 &+ D)
            e0 = (e0 &+ E)
        }

        //Produce the final hash value (big-endian) as a 160 bit number:
        var result = Array<UInt8>()
        result.reserveCapacity(160/8)

        [a0, b0, c0, d0, e0].forEach {
            result += Representations.toUInt8Array($0.bigEndian.reverseBytes())
        }

        return Representations.toHexadecimalString(result)
    }
    // swiftlint:enable function_body_length

}
