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


extension String {
    
    var moneyValue: String {
        let double = Double(self) ?? 0.0
        return String(format: "%0.2f", double)
    }
    
    var bankCardNoValue: String {
        let pre = self[safe: 0..<4] ?? ""
        
        let suffix = self[safe: self.count-4..<self.count] ?? ""
        
        let middle = "*" * (self.count-8)
        
        return pre+middle+suffix
    }
    
    var securePhoneValue: String {
        
        let pre = self[safe: 0..<3] ?? ""
        
        let suffix = self[safe: self.count-4..<self.count] ?? ""
        
        let middle = "*" * (self.count-7)
        
        return pre+middle+suffix
    }
    
}
