//
//  UIViewArrayExtension.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/4.
//  Copyright © 2019 Spec. All rights reserved.
//

import UIKit

public extension Array where Element: UIView {
    
    /// 是否隐藏
    var isHidden: Bool {
        set {
            for view in self {
                view.isHidden = newValue
            }
        }
        get {
            return !self.compactMap({ (view) -> Bool? in
                return view.isHidden
            }).contains(false)
        }
    }
    
    /// 从父视图隐藏
    func removeFromSuperView() {
        
        for view in self {
            view.removeFromSuperview()
        }
    }
    
    /// 旋转动画，反向互转
    func reverseRotaion() {
        
        for watiView in self {
            watiView.reverseRotation()
        }
    }
    
    func setBackground(color: UIColor) {
        
        forEach { $0.backgroundColor = color }
    }
    
    func setCorner(radius: CGFloat) {
        forEach { $0.cornerRadius = radius }
    }
    
}
