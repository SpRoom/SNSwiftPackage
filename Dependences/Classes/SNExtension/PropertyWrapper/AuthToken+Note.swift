//
//  AuthToken+Note.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/27.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation

#if swift(>=5.1)
@propertyWrapper
public struct AuthToken {
    
    private let tokenKey: String
    
    public init(key: String) {
        self.tokenKey = key
    }
    
//  Cannot use instance member 'tokenKey' within property initializer; property initializers run before 'self' is available
//    @UserDefault(tokenKey, defaultValue: nil)
//    private var tokenStr: String?
    
    public var wrappedValue: String? {
        get {
            let defaults = UserDefaults.standard
            guard let value = defaults.value(forKey: tokenKey) as? String else { return nil }
            return value
        }
        set {
            let defaults = UserDefaults.standard
            if let token = newValue {
                defaults.set(token, forKey: tokenKey)
            } else {
                defaults.removeObject(forKey: tokenKey)
            }
        }
    }
}
#endif
