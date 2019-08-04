//
//  UILabel_Extension.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import UIKit

extension Array where Element: UILabel {
    
    public var textColor: UIColor {
        set {
            for label in self {
                label.textColor = newValue
            }
        }
        get {
            return .black
        }
    }
}
