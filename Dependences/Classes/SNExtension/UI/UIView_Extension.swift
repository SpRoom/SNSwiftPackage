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


extension UIView {

    /// 画虚线，调用之前请确保能获取到frame
    /// 如果有多个calayer在当前空间 会使其他layer失效
    /// - Parameters:
    ///   - lineLength: 每一节线长
    ///   - lineSpacing: 间距
    ///   - lineColor: 颜色
    ///   - isHorizontal: 是否水平
    public func drawDashLine(lineLength: Int, lineSpacing: Int, lineColor: UIColor, isHorizontal: Bool = true) {

        if let sublayers = self.layer.sublayers {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }

        }
        //        self.layer.sublayers = nil

        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = self.bounds
        //        只要是CALayer这种类型,他的anchorPoint默认都是(0.5,0.5)
        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        //        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = lineColor.cgColor

        //        shapeLayer.lineWidth = self.frame.size.height
        //        shapeLayer.lineJoin = CAShapeLayerLineJoin.round

        shapeLayer.lineDashPattern = [NSNumber(value: lineLength), NSNumber(value: lineSpacing)]

        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        if isHorizontal {
            path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        } else {
            path.addLine(to: CGPoint(x: 0, y: self.frame.size.height))
        }
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }

}

extension UIView {
    
    public func shadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.cornerRadius = radius
    }
}
