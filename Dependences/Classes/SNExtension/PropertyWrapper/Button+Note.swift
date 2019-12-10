//
//  Button+Note.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/29.
//  Copyright © 2019 spectator. All rights reserved.
//

import UIKit
import SNSwiftPackage

#if swift(>=5.1)
@propertyWrapper
struct ButtonInitialized<Value: Button> {
    
    var value: Value?
    
    var defaultNormalText: String?
    var defaultTextFont: UIFont?
    var defaultImage: UIImage?
    
    init(_ normal: String? = nil, normalImage: UIImage? = nil, titleFont: UIFont? = nil) {
        self.defaultNormalText = normal
        self.defaultTextFont = titleFont
        self.defaultImage = normalImage
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
            if let text = defaultNormalText {
                tempValue.titleForNormal = text
            }
            if let font = defaultTextFont {
                tempValue.titleLabel?.font = font
            }
            if let image = defaultImage {
                tempValue.imageForNormal = image
            }
            value = tempValue
            return tempValue
        }
    }

}
#endif
