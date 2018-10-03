//
//  Utils.swift
//  KDBXKit
//
//  Created by Rajiv Shah on 10/3/18.
//  Copyright © 2018 Rajiv Shah. All rights reserved.
//

import Foundation
import Security

class CryptoUtils: NSObject {
    static func getRandomBytes(numberOfBytes: Int) -> Data? {
        var zeroBytes = Data(count: numberOfBytes)
        let result = {
            zeroBytes.withUnsafeMutableBytes(SecRandomCopyBytes(kSecRandomDefault, numberOfBytes, $0))
        }
        guard result == errSecSuccess else {
            return nil
        }
        return result
    }
}
