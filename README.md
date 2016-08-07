<p align="center">
<img src="assets/cryptography.png?raw=true" alt="Cryptography">
</p>

<p align = "center">
    <a href="https://developer.apple.com/swift">
      <img src="https://img.shields.io/badge/language-swift-orange.svg?style=flat" alt="Language">
    </a>
    <a href="https://developer.apple.com">
      <img src="https://img.shields.io/badge/platform-linux%20%7C%20osx%20%7C%20ios%20%7C%20watchos%20%7C%20tvos-lightgrey.svg?style=flat" alt="Platform">
    </a>
    <a href="https://raw.githubusercontent.com/mlachmish/Cryptography/blob/master/LICENSE">
      <img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="MIT licensed">
    </a>
  <br>
    <a href="https://travis-ci.org/mlachmish/Cryptography">
      <img src="https://travis-ci.org/mlachmish/Cryptography.svg?style=flat&branch=master" alt="Build Status">
    </a>
    <a href="https://www.codacy.com/app/mlachmish/Cryptography">
      <img src="https://api.codacy.com/project/badge/Grade/137aa31f62464045aad5f190123fdf67?style=flat" alt="Code Quality">
    </a>
    <a href="https://codecov.io/gh/mlachmish/Cryptography">
      <img src="https://codecov.io/gh/mlachmish/Cryptography/branch/master/graph/badge.svg?style=flat" alt="Code Coverage">
    </a>
    <a href="http://cocoadocs.org/docsets/Cryptography">
      <img src="https://img.shields.io/cocoapods/metrics/doc-percent/Cryptography.svg?style=flat" alt="Doc Coverage">
    </a>
  <br>
      <a href="https://cocoapods.org/pods/Cryptography">
        <img src="https://img.shields.io/cocoapods/v/Cryptography.svg?style=flat"
             alt="CocoaPods">
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"
             alt="Carthage">
    </a>
</p>

<br>
<p align="center">A modern cryptography library in Swift.</p>
<p align="center">
  <a href="#features">Features</a>
  • <a href="#usage">Usage</a>
  • <a href="#installation">Installation</a>
  • <a href="http://cocoadocs.org/docsets/Cryptography">Documentation</a>
  • <a href="#author">Author</a>
  • <a href="#license">License</a>
</p>

## Features

- [x] Hash Functions
  - MD5
  - SHA-1
  - SHA-2 <sub>(SHA-224, SHA-256, SHA-384, SHA-512, SHA-512/224, SHA-512/256)</sub>
  - SHA-3
- [x] Message Authentication Codes
  - HMAC <sub>(via: SHA-3/SHA-2/SHA-1/MD5)</sub>

### Soon to come
- [ ] High Speed Stream Ciphers
  - ChaCha
  - Panama
  - Sosemanuk
  - Salsa20
- [ ] block ciphers
  - AES (Rijndael)
  - Triple-DES (DES-EDE2 and DES-EDE3)
  - Blowfish
  - RC5
- [ ] Message Authentication Codes
  - VMAC
  - CMAC
  - GMAC
- [ ] Hash Functions
  - BLAKE2s
  - BLAKE2b
  - RIPEMD
- [ ] Public-Key Cryptography
  - RSA
  - DSA
  - ElGamal
  - Nyberg-Rueppel (NR)
  - Rabin-Williams (RW)
- [ ] Key Agreement Schemes
  - Diffie-Hellman (DH)
  - Unified Diffie-Hellman (DH2)
- [ ] Elliptic Curve Cryptography
  - ECDSA
  - ECNR
  - ECIES

## Usage

* [Hash Functions](#hash-functions)
* [Message Authentication Codes](#message-authentication-codes)

First import Cryptography module.
```swift 
import Cryptography
```
Everything you need is available via the ``` Cryptography ``` facade.

### Hash Functions
In order to calculate a hash value you simply call ``` Cryptography.hash(message: String, method: HashMethod) -> String ``` with the desired ``` HashMethod ```
```swift
let hashValue = Cryptography.hash("The quick brown fox jumps over the lazy dog", method: HashMethod.SHA1) // "2fd4e1c67a2d28fced849ee1bb76e7391b93eb12"
```

### Message Authentication Codes
In order to calculate a MAC value you simply call ``` authenticate(message: String, key: String, method: MACMethod) -> String ``` with the desired ``` MACMethod ```
```swift
let macValue = Cryptography.authenticate("The quick brown fox jumps over the lazy dog", key: "key", method: MACMethod.HMAC(hashMethod: HashMethod.SHA1)) // "de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9"
```

## Installation

### Compatibility

- OS X 10.9+ / iOS 8.0+ / watchOS 2.0 / tvOS 9.0

- Xcode 7.1+, Swift 2.1+

### Install Using CocoaPods
[CocoaPods](https://cocoapods.org/) is a centralized dependency manager for
Objective-C and Swift. Go [here](https://guides.cocoapods.org/using/index.html)
to learn more.

1. Add the project to your [Podfile](https://guides.cocoapods.org/using/the-podfile.html).

    ```ruby
    use_frameworks!

    pod 'Cryptography'
    ```

2. Run `pod install` and open the `.xcworkspace` file to launch Xcode.

### Install Using Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency
manager for Objective-C and Swift.

1. Add the project to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

    ```
    github "mlachmish/Cryptography"
    ```

2. Run `carthage update` and follow [the additional steps](https://github.com/Carthage/Carthage#getting-started)
   in order to add Cryptography to your project.
    
###Swift Package Manager
You can use [Swift Package Manager](https://swift.org/package-manager/) and specify dependency in `Package.swift` by adding this:
```
.Package(url: "https://github.com/mlachmish/Cryptography.git", majorVersion: 0)
```

### Manually
Download and drop ```/Cryptography``` folder in your project.

## Author

Matan Lachmish <sub>a.k.a</sub> <b>The Big Fat Ninja</b> <img src="assets/TheBigFatNinja.png?raw=true" alt="The Big Fat Ninja" width="13"><br>
https://thebigfatninja.xyz

### Audit & Security Disclosure

If you believe you have identified a security vulnerability with Cryptography,<br>
please report it as soon as possible via email to security@thebigfatninja.xyz<br>
Do not post it to the public issue tracker.

### attribution

Icon made by <a title="Freepik" href="http://www.freepik.com">Freepik</a> from <a title="Flaticon" href="http://www.flaticon.com">www.flaticon.com</a>

## License

Cryptography is available under the MIT license. See the LICENSE file for more info.
