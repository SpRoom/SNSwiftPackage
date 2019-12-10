//
//  Image+Note.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/29.
//  Copyright © 2019 spectator. All rights reserved.
//

import UIKit

#if swift(>=5.1)
@propertyWrapper
struct ImageViewInitialized<Value: ImageView> {
    
     var value: Value?
    
     var defaultImage: UIImage?
    var mode: UIView.ContentMode?
    
    /// 默认初始化
    /// - Parameter text: 默认文字
    /// - Parameter font: 默认字体
    init(_ image: UIImage? = nil, mode: UIView.ContentMode? = nil) {
        self.defaultImage = image
        self.mode = mode
    }
    
    var wrappedValue: Value {
        set {
            value = newValue
        }
        mutating get {
            if let value = value {
                return value
            }
            let tempValue = Value()
            tempValue.image = defaultImage
            if let mode = mode {
                tempValue.contentMode = mode
            }
            value = tempValue
            return tempValue
        }
    }
}
#endif

/*
struct DefaultInitialized<Value> {
    
    private var value: Value?
    
    var wrappedValue: Value {
        set {
            value = newValue
        }
        mutating get {
            if let value = value {
                return value
            }
            let tempValue = Value()
            
            value = tempValue
            return tempValue
        }
    }
    
}
*/
