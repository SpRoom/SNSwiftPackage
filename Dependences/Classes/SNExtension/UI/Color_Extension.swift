//
//  Color_Extension.swift
//  cityTable
//
//  Created by spectator Mr.Z on 2017/5/13.
//  Copyright © 2017年 spectator Mr.Z. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    public convenience init(hexadecimal netHex:Int, alpha: CGFloat = 1.0) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff, alpha: alpha)
    }
    
    /*
     convenience init(hexadecimalStr hex: String) {
     var cString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
     
     if (cString.hasPrefix("#")) {
     let index = cString.index(cString.startIndex, offsetBy:1)
     cString = cString.substring(from: index)
     }
     
     if (cString.characters.count != 6) {
     self.init(white: 1, alpha: 1)
     } else{
     
     let rIndex = cString.index(cString.startIndex, offsetBy: 2)
     let rString = cString.substring(to: rIndex)
     let otherString = cString.substring(from: rIndex)
     let gIndex = otherString.index(otherString.startIndex, offsetBy: 2)
     let gString = otherString.substring(to: gIndex)
     let bIndex = cString.index(cString.endIndex, offsetBy: -2)
     let bString = cString.substring(from: bIndex)
     
     var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
     Scanner(string: rString).scanHexInt32(&r)
     Scanner(string: gString).scanHexInt32(&g)
     Scanner(string: bString).scanHexInt32(&b)
     
     self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
     }
     }
     */
}

/// 十六进制颜色
public func Color(_ hex: Int) -> UIColor {
    return UIColor(hexadecimal: hex)
}
