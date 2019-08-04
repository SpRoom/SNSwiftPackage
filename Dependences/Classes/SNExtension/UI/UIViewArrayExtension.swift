//
//  UIViewArrayExtension.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/4.
//  Copyright © 2019 Spec. All rights reserved.
//

import UIKit

public extension Array where Element: UIView {
    
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
    
    func removeFromSuperView() {
        
        for view in self {
            view.removeFromSuperview()
        }
    }
    
    func reverseRotaion() {
        
        for watiView in self {
            watiView.reverseRotation()
        }
    }
    
}
