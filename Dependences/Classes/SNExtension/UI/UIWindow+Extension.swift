//
//  UIWindow+Extension.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/4.
//  Copyright © 2019 zsh. All rights reserved.
//

import UIKit
//import SNSwiftPackage

extension UIWindow {

    public var splash: UIView? {
        set {
            guard  let view = newValue else { return }
            view.accessibilityIdentifier = "windowSplash"
            view.frame = bounds
            addSubview(view)
        }
        get {

            return subviews.filter({ $0.accessibilityIdentifier == "windowSplash" }).first
        }
    }

    public var splashFirst: Bool {

        if let splashView = splash {

            bringSubviewToFront(splashView)
            return true
        }

        return false
    }
}
