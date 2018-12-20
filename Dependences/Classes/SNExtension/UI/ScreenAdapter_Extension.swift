//
//  ScreenAdapter_Extension.swift
//  Syntax-SNSwfitPackage
//
//  Created by zyt on 2018/12/20.
//  Copyright © 2018 zsh. All rights reserved.
//

import Foundation
import UIKit

/// 适配数值
public func fit(_ attribute: SNAdapterTarget) -> CGFloat {
    //    return adjustSizeWithUiDesign(attribute: attribute, UiDesignWidth: designWidth)
    
    let attribute = CGFloat(truncating: attribute as! NSNumber)
    
    return adjustSize(attribute: attribute)
    
    
}



public enum UIAnnotationType : Int {
    case px = 0, pt
}

public let ScreenW = UIScreen.main.bounds.width

public let ScreenH = UIScreen.main.bounds.height


/// UI设计图 px
var annotationType : UIAnnotationType = .px
var designWidth : CGFloat = 750.0




//用于屏幕设配 等比例方法缩小
fileprivate func adjustSize(attribute: CGFloat) -> CGFloat {
    
    if annotationType == .px {
        let scale = UIScreen.main.scale
        let widthPx = ScreenW * scale
        
        let rate = widthPx/designWidth
        
        let result = attribute * rate
        
        return result
    } else {
        
        let rate = ScreenW / designWidth
        let result = attribute * rate
        
        return result
    }
}


//此方法基本不用, 废弃
func adjustSizeWithUiDesign(attribute: CGFloat,UiDesignWidth: CGFloat) -> CGFloat {
    let rate = UiDesignWidth/414.0
    
    return adjustSize(attribute: attribute/rate)
}


public protocol SNAdapterTarget {
}

extension Int: SNAdapterTarget {
}

extension UInt: SNAdapterTarget {
}

extension Float: SNAdapterTarget {
}

extension Double: SNAdapterTarget {
}

extension CGFloat: SNAdapterTarget {
}
