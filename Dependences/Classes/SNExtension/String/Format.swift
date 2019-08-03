//
//  Format.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/3.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import CoreGraphics

func Format(cgfloat: CGFloat, decimal num: Int) -> String {
    
    return String(format: "%.\(num)f", cgfloat)
}

func Format(int: Int, digits: Int) -> String {
    
    return String(format: "%02d", int)
}

func fractionDigits(value: CGFloat, min: Int = 2, max: Int = 2, roundingMode: NumberFormatter.RoundingMode = .down) -> String {
    let number = NumberFormatter()
    number.minimumFractionDigits = min
    number.maximumFractionDigits = max
    number.roundingMode = roundingMode
    number.numberStyle = .decimal
    //    number.alwaysShowsDecimalSeparator = false
    number.usesGroupingSeparator = false
    return number.string(for: value) ?? ""
}

public extension Double {
    
    var moneyStr: String {
        return fractionDigits(value: self.cgFloat)
        //        return String(format: "%.2f", self)
    }
    
    var moneyIncreStr: String {
        
        return fractionDigits(value: self.cgFloat, min: 2, max: 2, roundingMode: .up)
    }
}

extension Float {
    
    var moneyStr: String {
        return fractionDigits(value: self.cgFloat)
        //        return String(format: "%.2f", self)
    }
}
