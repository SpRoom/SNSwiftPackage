//
//  UIImage_Extension.swift
//  diandianzanumsers
//
//  Created by 楠 on 2017/6/9.
//  Copyright © 2017年 specddz. All rights reserved.
//

import Foundation
import UIKit

// UI
/// 图片
public func Image(_ name: String) -> UIImage? {
    return UIImage(named: name)
}

extension UIImage {
    
    //创建纯颜色图片
    public static func createImageBy(color : UIColor) -> UIImage{
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!
    }
    
}
