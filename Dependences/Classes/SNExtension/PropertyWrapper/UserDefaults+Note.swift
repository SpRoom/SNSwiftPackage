//
//  UserDefaults+Note.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/27.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation

#if swift(>=5.1)
@propertyWrapper
public struct UserDefault<T> {
    
    let key: String
    let defaultValue: T
    
    /// UserDefault 默认参数
    /// - Parameter key: 储存关键字
    /// - Parameter defaultValue: 默认储存对象
    public init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
#endif
