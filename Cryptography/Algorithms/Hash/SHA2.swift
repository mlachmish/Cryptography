//
//  SHA2.swift
//  Cryptography
//
//  Created by Matan Lachmish on 25/07/2016.
//  Copyright © 2016 The Big Fat Ninja. All rights reserved.
//

import Foundation

// swiftlint:disable variable_name
// swiftlint:disable line_length
// swiftlint:disable comma

public enum SHA2Variant {
    case SHA224
    case SHA256
    case SHA384
    case SHA512
    case SHA512SLASH224
    case SHA512SLASH256

    public func hash(message: [UInt8]) -> [UInt8] {
        switch self {
        case .SHA224, .SHA256:
            return SHA2.hash32Bit(message, sha2Variant: self)
        case .SHA384, .SHA512, .SHA512SLASH224, .SHA512SLASH256:
            return SHA2.hash64Bit(message, sha2Variant: self)
        }
    }

    public func hash(message: String) -> String {
        switch self {
        case .SHA224, .SHA256:
            return SHA2.hash32Bit(message, sha2Variant: self)
        case .SHA384, .SHA512, .SHA512SLASH224, .SHA512SLASH256:
            return SHA2.hash64Bit(message, sha2Variant: self)
        }
    }

    internal var blockSize: Int {
        switch self {
        case .SHA224, .SHA256:
            return SHA2Constants.blockSizeSHA256
        case .SHA384, .SHA512, .SHA512SLASH224, .SHA512SLASH256:
            return SHA2Constants.blockSizeSHA512
        }
    }

    private var h: [UInt64] {
        switch self {
        case .SHA224:
            return SHA2Constants.hSHA224
        case .SHA256:
            return SHA2Constants.hSHA256
        case .SHA384:
            return SHA2Constants.hSHA384
        case .SHA512:
            return SHA2Constants.hSHA512
        case .SHA512SLASH224:
            return SHA2Constants.hSHA512SLASH224
        case .SHA512SLASH256:
            return SHA2Constants.hSHA512SLASH256
        }
    }

    private var k: [UInt64] {
        switch self {
        case .SHA224, .SHA256:
            return SHA2Constants.kSHA256
        case .SHA384, .SHA512, .SHA512SLASH224, .SHA512SLASH256:
            return SHA2Constants.kSHA512
        }
    }

    private func truncateResult<T>(h: [T]) -> ArraySlice<T> {
        switch self {
        case .SHA224:
            return h[0..<7]
        case .SHA384:
            return h[0..<6]
        case .SHA512SLASH224:
            return h[0..<4]
        case .SHA512SLASH256:
            return h[0..<4]
        default:
            break
        }
        return ArraySlice(h)
    }

}

private struct SHA2Constants {

    static let blockSizeSHA256 = 64
    static let blockSizeSHA512 = 128

    static let hSHA224: Array<UInt64> =
        [0xc1059ed8, 0x367cd507, 0x3070dd17, 0xf70e5939, 0xffc00b31, 0x68581511, 0x64f98fa7, 0xbefa4fa4]

    static let hSHA256: Array<UInt64> =
        [0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19]

    static let hSHA384: Array<UInt64> =
        [0xcbbb9d5dc1059ed8, 0x629a292a367cd507, 0x9159015a3070dd17, 0x152fecd8f70e5939,
         0x67332667ffc00b31, 0x8eb44a8768581511, 0xdb0c2e0d64f98fa7, 0x47b5481dbefa4fa4]

    static let hSHA512: Array<UInt64> =
        [0x6a09e667f3bcc908, 0xbb67ae8584caa73b, 0x3c6ef372fe94f82b, 0xa54ff53a5f1d36f1,
         0x510e527fade682d1, 0x9b05688c2b3e6c1f, 0x1f83d9abfb41bd6b, 0x5be0cd19137e2179]

    static let kSHA256: Array<UInt64> =
        [0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
         0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
         0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
         0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
         0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
         0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
         0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
         0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2]

    static let kSHA512: Array<UInt64> =
        [0x428a2f98d728ae22, 0x7137449123ef65cd, 0xb5c0fbcfec4d3b2f, 0xe9b5dba58189dbbc, 0x3956c25bf348b538,
         0x59f111f1b605d019, 0x923f82a4af194f9b, 0xab1c5ed5da6d8118, 0xd807aa98a3030242, 0x12835b0145706fbe,
         0x243185be4ee4b28c, 0x550c7dc3d5ffb4e2, 0x72be5d74f27b896f, 0x80deb1fe3b1696b1, 0x9bdc06a725c71235,
         0xc19bf174cf692694, 0xe49b69c19ef14ad2, 0xefbe4786384f25e3, 0x0fc19dc68b8cd5b5, 0x240ca1cc77ac9c65,
         0x2de92c6f592b0275, 0x4a7484aa6ea6e483, 0x5cb0a9dcbd41fbd4, 0x76f988da831153b5, 0x983e5152ee66dfab,
         0xa831c66d2db43210, 0xb00327c898fb213f, 0xbf597fc7beef0ee4, 0xc6e00bf33da88fc2, 0xd5a79147930aa725,
         0x06ca6351e003826f, 0x142929670a0e6e70, 0x27b70a8546d22ffc, 0x2e1b21385c26c926, 0x4d2c6dfc5ac42aed,
         0x53380d139d95b3df, 0x650a73548baf63de, 0x766a0abb3c77b2a8, 0x81c2c92e47edaee6, 0x92722c851482353b,
         0xa2bfe8a14cf10364, 0xa81a664bbc423001, 0xc24b8b70d0f89791, 0xc76c51a30654be30, 0xd192e819d6ef5218,
         0xd69906245565a910, 0xf40e35855771202a, 0x106aa07032bbd1b8, 0x19a4c116b8d2d0c8, 0x1e376c085141ab53,
         0x2748774cdf8eeb99, 0x34b0bcb5e19b48a8, 0x391c0cb3c5c95a63, 0x4ed8aa4ae3418acb, 0x5b9cca4f7763e373,
         0x682e6ff3d6b2b8a3, 0x748f82ee5defb2fc, 0x78a5636f43172f60, 0x84c87814a1f0ab72, 0x8cc702081a6439ec,
         0x90befffa23631e28, 0xa4506cebde82bde9, 0xbef9a3f7b2c67915, 0xc67178f2e372532b, 0xca273eceea26619c,
         0xd186b8c721c0c207, 0xeada7dd6cde0eb1e, 0xf57d4f7fee6ed178, 0x06f067aa72176fba, 0x0a637dc5a2c898a6,
         0x113f9804bef90dae, 0x1b710b35131c471b, 0x28db77f523047d84, 0x32caab7b40c72493, 0x3c9ebe0a15c9bebc,
         0x431d67c49c100d4c, 0x4cc5d4becb3e42b6, 0x597f299cfc657e2a, 0x5fcb6fab3ad6faec, 0x6c44198c4a475817]

    static let hSHA512SLASH224: Array<UInt64> =
        [0x8C3D37C819544DA2, 0x73E1996689DCD4D6, 0x1DFAB7AE32FF9C82, 0x679DD514582F9FCF,
         0x0F6D2B697BD44DA8, 0x77E36F7304C48942, 0x3F9D85A86A1D36C8, 0x1112E6AD91D692A1]

    static let hSHA512SLASH256: Array<UInt64> =
        [0x22312194FC2BF72C, 0x9F555FA3C84C64C2, 0x2393B86B6F53B151, 0x963877195940EABD,
         0x96283EE2A88EFFE3, 0xBE5E1E2553863992, 0x2B0199FC2C85B8AA, 0x0EB72DDC81C52CA2]
}

// swiftlint:enable variable_name
// swiftlint:enable line_length
// swiftlint:enable comma

internal struct SHA2 {

    private static func preprocessMessage(message: Array<UInt8>,
                                          messageLengthBits: Int) -> Array<UInt8> {

        var preprocessedMessage = message
        // Pre-processing: adding a single 1 bit
        // Notice: the input bytes are considered as bits strings,
        // where the first bit is the most significant bit of the byte.
        preprocessedMessage.append(0x80)

        // Pre-processing: padding with zeros
        // append "0" bit until message length in bits ≡ 448 (mod 512)
        let desiredMessageLengthModulo = messageLengthBits - 8
        var messageLength = preprocessedMessage.count
        var paddingCounter = 0
        while messageLength % messageLengthBits != desiredMessageLengthModulo {
            paddingCounter += 1
            messageLength += 1
        }
        preprocessedMessage += Array<UInt8>(count: paddingCounter, repeatedValue: 0)
        // append original length in bits mod (2 pow 64) to message
        preprocessedMessage.reserveCapacity(preprocessedMessage.count + 4)
        let lengthInBits = message.count * 8
        let lengthBytes = Representations.toUInt8Array(lengthInBits, length: 64/8)
        preprocessedMessage += lengthBytes
        return preprocessedMessage
    }

    // swiftlint:disable function_body_length
    // MARK: 32 bit version
    static func hash32Bit(message: [UInt8], sha2Variant: SHA2Variant) -> [UInt8] {
        // Initialize variables:
        var a0 = UInt32(sha2Variant.h[0])   // A
        var b0 = UInt32(sha2Variant.h[1])   // B
        var c0 = UInt32(sha2Variant.h[2])   // C
        var d0 = UInt32(sha2Variant.h[3])   // D
        var e0 = UInt32(sha2Variant.h[4])   // E
        var f0 = UInt32(sha2Variant.h[5])   // F
        var g0 = UInt32(sha2Variant.h[6])   // G
        var h0 = UInt32(sha2Variant.h[7])   // H

        // Pre-processing
        let preprocessedMessage = preprocessMessage(message,
                                                    messageLengthBits:sha2Variant.blockSize)

        // Process the message in successive 512-bit chunks:
        let chunkSizeBytes = 512 / 8
        for chunk in preprocessedMessage.splitToChuncks(chunkSizeBytes) {
            // Break chunk into sixteen 32-bit big-endian words w[i], 0 ≤ i ≤ 15
            // Extend the sixteen 32-bit words into eighty 32-bit words:
            var M: Array<UInt32> = Array<UInt32>(count: sha2Variant.k.count, repeatedValue: 0)

            for x in 0..<M.count {
                switch x {
                case 0...15:
                    let start = chunk.startIndex + (x * sizeofValue(M[x]))
                    let end = start + sizeofValue(M[x])
                    let le = Representations.mergeToUInt32Array(chunk[start..<end])[0]
                    M[x] = le.bigEndian
                    break
                default:
                    let s0 = M[x-15].rotateRight(7) ^ M[x-15].rotateRight(18) ^ M[x-15] >> 3
                    let s1 = M[x-2].rotateRight(17) ^ M[x-2].rotateRight(19) ^ M[x-2] >> 10
                    M[x] = M[x-16] &+ s0 &+ M[x-7] &+ s1
                    break
                }
            }

            // Initialize hash value for this chunk:
            var A = a0
            var B = b0
            var C = c0
            var D = d0
            var E = e0
            var F = f0
            var G = g0
            var H = h0

            // Main loop:
            for i in 0..<sha2Variant.k.count {
                let S1 = E.rotateRight(6) ^ E.rotateRight(11) ^ E.rotateRight(25)
                let ch = (E & F) ^ (~E & G)
                let temp1 = H &+ S1 &+ ch &+ UInt32(sha2Variant.k[i]) &+ M[i]
                let S0 = A.rotateRight(2) ^ A.rotateRight(13) ^ A.rotateRight(22)
                let maj = (A & B) ^ (A & C) ^ (B & C)
                let temp2 = S0 &+ maj

                H = G
                G = F
                F = E
                E = D &+ temp1
                D = C
                C = B
                B = A
                A = temp1 &+ temp2
            }

            // Add this chunk's hash to result so far:
            a0 = (a0 &+ A)
            b0 = (b0 &+ B)
            c0 = (c0 &+ C)
            d0 = (d0 &+ D)
            e0 = (e0 &+ E)
            f0 = (f0 &+ F)
            g0 = (g0 &+ G)
            h0 = (h0 &+ H)
        }

        // Produce the final hash value (big-endian) as a 160 bit number:
        var result = Array<UInt8>()
        result.reserveCapacity(160/8)

        sha2Variant.truncateResult([a0, b0, c0, d0, e0, f0, g0, h0]).forEach {
            result += Representations.toUInt8Array($0.bigEndian.reverseBytes())
        }

        return result
    }

    static func hash32Bit(message: String, sha2Variant: SHA2Variant) -> String {
        return Representations.toHexadecimalString(
            self.hash32Bit(Array(message.utf8), sha2Variant: sha2Variant)
        )
    }

    // MARK: 64 bit version
    static func hash64Bit(message: [UInt8], sha2Variant: SHA2Variant) -> [UInt8] {
        // Initialize variables:
        var a0 = sha2Variant.h[0]   // A
        var b0 = sha2Variant.h[1]   // B
        var c0 = sha2Variant.h[2]   // C
        var d0 = sha2Variant.h[3]   // D
        var e0 = sha2Variant.h[4]   // E
        var f0 = sha2Variant.h[5]   // F
        var g0 = sha2Variant.h[6]   // G
        var h0 = sha2Variant.h[7]   // H

        // Pre-processing
        let preprocessedMessage = preprocessMessage(message,
                                                    messageLengthBits:sha2Variant.blockSize)

        // Process the message in successive 512-bit chunks:
        let chunkSizeBytes = 1024 / 8
        for chunk in preprocessedMessage.splitToChuncks(chunkSizeBytes) {
            // Break chunk into sixteen 32-bit big-endian words w[i], 0 ≤ i ≤ 15
            // Extend the sixteen 32-bit words into eighty 32-bit words:
            var M: Array<UInt64> = Array<UInt64>(count: sha2Variant.k.count, repeatedValue: 0)

            for x in 0..<M.count {
                switch x {
                case 0...15:
                    let start = chunk.startIndex + (x * sizeofValue(M[x]))
                    let end = start + sizeofValue(M[x])
                    let le = Representations.mergeToUInt64Array(chunk[start..<end])[0]
                    M[x] = le.bigEndian
                    break
                default:
                    let s0 = M[x-15].rotateRight(1) ^ M[x-15].rotateRight(8) ^ M[x-15] >> 7
                    let s1 = M[x-2].rotateRight(19) ^ M[x-2].rotateRight(61) ^ M[x-2] >> 6
                    M[x] = M[x-16] &+ s0 &+ M[x-7] &+ s1
                    break
                }
            }

            // Initialize hash value for this chunk:
            var A = a0
            var B = b0
            var C = c0
            var D = d0
            var E = e0
            var F = f0
            var G = g0
            var H = h0

            // Main loop:
            for i in 0..<sha2Variant.k.count {
                let S1 = E.rotateRight(14) ^ E.rotateRight(18) ^ E.rotateRight(41)
                let ch = (E & F) ^ (~E & G)
                let temp1 = H &+ S1 &+ ch &+ UInt64(sha2Variant.k[i]) &+ M[i]
                let S0 = A.rotateRight(28) ^ A.rotateRight(34) ^ A.rotateRight(39)
                let maj = (A & B) ^ (A & C) ^ (B & C)
                let temp2 = S0 &+ maj

                H = G
                G = F
                F = E
                E = D &+ temp1
                D = C
                C = B
                B = A
                A = temp1 &+ temp2
            }

            // Add this chunk's hash to result so far:
            a0 = (a0 &+ A)
            b0 = (b0 &+ B)
            c0 = (c0 &+ C)
            d0 = (d0 &+ D)
            e0 = (e0 &+ E)
            f0 = (f0 &+ F)
            g0 = (g0 &+ G)
            h0 = (h0 &+ H)
        }

        // Produce the final hash value (big-endian) as a 160 bit number:
        var result = Array<UInt8>()
        result.reserveCapacity(160/8)

        sha2Variant.truncateResult([a0, b0, c0, d0, e0, f0, g0, h0]).forEach {
            result += Representations.toUInt8Array($0.bigEndian.reverseBytes())
        }

        if sha2Variant == .SHA512SLASH224 {
            result = Array(result[0..<result.count - 4])
        }

        return result
    }
    // swiftlint:enable function_body_length

    static func hash64Bit(message: String, sha2Variant: SHA2Variant) -> String {
        return Representations.toHexadecimalString(
            self.hash64Bit(Array(message.utf8), sha2Variant: sha2Variant)
        )
    }

}
