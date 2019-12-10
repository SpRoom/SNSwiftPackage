//
//  UIAlertControllerExtensions.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/16.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation

extension UIAlertController {
    
    func addAction(_ action: UIAlertAction, textColor: UIColor? = nil) {
        addAction(action)

        if let textColor = textColor {
        action.setValue(textColor, forKey: "titleTextColor")
        }
    }
    
    func addActions(_ action: [UIAlertAction], textColor: UIColor? = nil) {
        action.forEach { (action) in
            addAction(action, textColor: textColor)
        }
    }
}
