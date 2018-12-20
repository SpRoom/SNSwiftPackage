//
//  UIView_Extension.swift
//  diandianzanumsers
//
//  Created by 楠 on 2017/7/13.
//  Copyright © 2017年 specddz. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /// 圆角
   public func corner(with: CGFloat, coners: UIRectCorner, file: String = #file, function: String = #function, line: Int = #line) {
    
    guard let sup = self.superview else {
        SNLog("corner failed, the reason is can't find superview", file: file, function: function, line: line)
        return
    }
    // if use snapkit, need update frame
    sup.layoutIfNeeded()
    
    
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: coners, cornerRadii: CGSize(width: with, height: with))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    

        /// add subviews  批量添加子视图
       public func addSubviews(views: [UIView]) {
            
            for v in views {
                self.addSubview(v)
            }
            
        }
    
    
}
