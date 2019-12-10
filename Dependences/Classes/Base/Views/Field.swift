//
//  Field.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/30.
//  Copyright © 2019 spectator. All rights reserved.
//

import UIKit

class Field: UITextField {

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        if leftView != nil {
            return bounds.insetBy(dx: 40, dy: 0)
        }
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        if leftView != nil {
            return bounds.insetBy(dx: 40, dy: 0)
        }
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        
        var rightRect = super.rightViewRect(forBounds: bounds)
        rightRect.origin.x -= 10
        return rightRect
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var leftRect = super.leftViewRect(forBounds: bounds)
        leftRect.origin.x += 10
        return leftRect
    }

}
