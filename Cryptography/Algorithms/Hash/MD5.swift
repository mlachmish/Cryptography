//
// Created by Matan Lachmish on 04/07/2016.
// Copyright (c) 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

//Fowllowing the pseudo code from https://en.wikipedia.org/wiki/MD5

private struct MD5Constants {
    static let messageLengthBits = 64
}

internal class MD5: HashProtocol {
    // swiftlint:disable variable_name
    // swiftlint:disable line_length
    // swiftlint:disable comma

    //Specifies the per-round shift amounts
    private static let s: Array<UInt32> = [7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,  7, 12, 17, 22,
                                           5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,  5,  9, 14, 20,
                                           4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,  4, 11, 16, 23,
                                           6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21,  6, 10, 15, 21]

    //Use binary integer part of the sines of integers (Radians) as constants
    private static let k: Array<UInt32> = [0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
                                           0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
                                           0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
                                           0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
                                           0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
                                           0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
                                           0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
                                           0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
                                           0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
                                           0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
                                           0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x4881d05,
                                           0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
                                           0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
                                           0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
                                           0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
                                           0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391]
    // swiftlint:enable variable_name
    // swiftlint:enable line_length
    // swiftlint:enable comma

    private static func preprocessMessage(message: Array<UInt8>) -> Array<UInt8> {
        var preprocessedMessage = message //Copy message

        //Pre-processing: adding a single 1 bit
        //Notice: the input bytes are considered as bits strings,
        //where the first bit is the most significant bit of the byte.
        preprocessedMessage.append(0x80)

        //Pre-processing: padding with zeros
        //append "0" bit until message length in bits ≡ 448 (mod 512)
        let desiredMessageLengthModulo = (MD5Constants.messageLengthBits - 8)
        var messageLength = preprocessedMessage.count
        var paddingCounter = 0
        while messageLength % MD5Constants.messageLengthBits != desiredMessageLengthModulo {
            paddingCounter += 1
            messageLength += 1
        }
        preprocessedMessage += Array<UInt8>(count: paddingCounter, repeatedValue: 0)

        //append original length in bits mod (2 pow 64) to message
        preprocessedMessage.reserveCapacity(preprocessedMessage.count + 4)
        let lengthInBits = (message.count * 8)
        let lengthBytes = Representations.toUInt8Array(lengthInBits, length: 64/8)
        preprocessedMessage += lengthBytes.reverse()
        return preprocessedMessage
    }

    // swiftlint:disable function_body_length
    static func hash(message: String) -> String {

        //Initialize variables:
        var a0 = UInt32(0x67452301)   //A
        var b0 = UInt32(0xefcdab89)   //B
        var c0 = UInt32(0x98badcfe)   //C
        var d0 = UInt32(0x10325476)   //D

        //Pre-processing
        let preprocessedMessage = preprocessMessage(Array(message.utf8))

        //Process the message in successive 512-bit chunks:
        let chunkSizeBytes = 512 / 8

        for chunk in preprocessedMessage.splitToChuncks(chunkSizeBytes) {
            //break chunk into sixteen 32-bit words M[j], 0 ≤ j ≤ 15
            let M = Representations.mergeToUInt32Array(chunk)

            //Initialize hash value for this chunk:
            var A: UInt32 = a0
            var B: UInt32 = b0
            var C: UInt32 = c0
            var D: UInt32 = d0

            //Main loop:
            for i in 0..<s.count {
                var F: UInt32 = 0
                var g = 0

                switch i {
                case 0...15:
                    F = (B & C) | ((~B) & D)
                    g = i
                    break
                case 16...31:
                    F = (D & B) | (~D & C)
                    g = (5 * i + 1) % 16
                    break
                case 32...47:
                    F = B ^ C ^ D
                    g = (3 * i + 5) % 16
                    break
                case 48...63:
                    F = C ^ (B | (~D))
                    g = (7 * i) % 16
                    break
                default:
                    break
                }

                let dTemp = D
                D = C
                C = B
                B = B &+ (A &+ F &+ k[i] &+ M[g]).rotateLeft(s[i])
                A = dTemp
            }

            a0 = a0 &+ A
            b0 = b0 &+ B
            c0 = c0 &+ C
            d0 = d0 &+ D
        }

        var result = Array<UInt8>()

        result.reserveCapacity(128/8)
        [a0, b0, c0, d0].forEach {
            result += Representations.toUInt8Array($0.littleEndian.reverseBytes())
        }

        return Representations.toHexadecimalString(result)
    }
    // swiftlint:enable function_body_length

}
