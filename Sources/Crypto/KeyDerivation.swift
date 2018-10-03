//
//  KeyDerivation.swift
//  KDBXKit
//
//  Created by Rajiv Shah on 10/3/18.
//  Copyright © 2018 Rajiv Shah. All rights reserved.
//

import Foundation

protocol KeyDerivationProtocol {
    public func deriveKey(seed: Data) -> Data?
    public var salt: Data
}

// MARK: Argon2
class Argon2KeyDerivation: KeyDerivationProtocol {
    public init() {}
    public func deriveKey(seed: Data) -> Data? {
        let argon2Crypto = CatArgon2Crypto()
        
        // Set parameters
        argon2Crypto.context.mode = mode
        argon2Crypto.context.iterations = iterations
        argon2Crypto.context.memory = memory
        argon2Crypto.context.parallelism = parallelism
        argon2Crypto.context.hashLength = hashLength
        argon2Crypto.context.salt = salt
        
        var seedString = String(bytes: seed, encoding: .utf8)
        guard let resultString = argon2Crypto.hash(password: seedString!) else {
            return nil
        }
        let result = seedString?.data(using: .utf8)
        return result
    }
    
    public var salt: Data
    public var iterations: Int
    public var memory: Int
    public var parallelism: Int
    public var hashLength: Int
    public var mode: CatArgon2Mode
}

// MARK: AES
class AESKeyDerivation: KeyDerivationProtocol {
    public init() {}
    public func deriveKey(seed: Data) -> Data? {
        <#code#>
    }
    public var salt: Data
}
