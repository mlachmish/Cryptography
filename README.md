<p align="center">
<img src="assets/cryptography.png?raw=true" alt="Cryptography">
</p>

<p align = "center">
  <a href="https://developer.apple.com/swift">
    <img src="https://img.shields.io/badge/language-swift-orange.svg?style=flat" alt="Language">
  </a>
  <a href="https://developer.apple.com">
    <img src="https://img.shields.io/badge/platform-osx%20%7C%20ios%20%7C%20watchos%20%7C%20tvos-lightgrey.svg?style=flat" alt="Platform">
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
</p>

<br>
<p align="center">A modern cryptography library in Swift.</p>
<p align="center">
    <a href="#installation">Installation</a>
  • <a href="#usage">Usage</a>
  • <a href="#author">Author</a>
  • <a href="#license">License</a>
</p>

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

3. Import the Cryptography framework.

    ```swift
    import Cryptography
    ```

### Install Using Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency
manager for Objective-C and Swift.

1. Add the project to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

    ```
    github "mlachmish/Cryptography"
    ```

2. Run `carthage update` and follow [the additional steps](https://github.com/Carthage/Carthage#getting-started)
   in order to add Cryptography to your project.

3. Import the Cryptography framework.

    ```swift
    import Cryptography
    ```
    
#### Manually
Download and drop ```/Cryptography``` folder in your project.

## Usage

## Author

Matan Lachmish <sub>a.k.a</sub> <b>The Big Fat Ninja</b> <img src="assets/TheBigFatNinja.png?raw=true" alt="The Big Fat Ninja" width="13"><br>
https://thebigfatninja.xyz

### attribution

Icon made by <a title="Freepik" href="http://www.freepik.com">Freepik</a> from <a title="Flaticon" href="http://www.flaticon.com">www.flaticon.com</a>

## License

Cryptography is available under the MIT license. See the LICENSE file for more info.
