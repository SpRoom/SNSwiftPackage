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
    
   public func corner(with: CGFloat, coners: UIRectCorner) {
        
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: with, height: with))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    

        
       public func addSubviews(views: [UIView]) {
            
            for v in views {
                self.addSubview(v)
            }
            
        }
    
    
}
