//
//  Label+Note.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/29.
//  Copyright © 2019 spectator. All rights reserved.
//

import UIKit

#if swift(>=5.1)
@propertyWrapper
struct LabelInitialized<Value: Label> {
    
    var value: Value?
    
    var defaultText: String?
    //    let defaultTextColor: UIColor
    var defautlFont: UIFont?
    var numberOfLines: Int?
    var textAligment: NSTextAlignment?
    
    /// 默认初始化
    /// - Parameter text: 默认文字
    /// - Parameter font: 默认字体
    init(_ text: String? = nil, font: UIFont? = nil, lines: Int? = nil, textAlignment: NSTextAlignment? = nil) {
        self.defaultText = text
        //        self.defaultTextColor = color
        self.defautlFont = font
        self.numberOfLines = lines
        self.textAligment = textAlignment
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
            tempValue.text = defaultText
            //            tempValue.textColor = defaultTextColor
            if let font = defautlFont {
                tempValue.font = font
            }
            if let lines = numberOfLines {
                tempValue.numberOfLines = lines
            }
            if let alignment = textAligment {
                tempValue.textAlignment = alignment
            }
            value = tempValue
            return tempValue
        }
    }
}
#endif
