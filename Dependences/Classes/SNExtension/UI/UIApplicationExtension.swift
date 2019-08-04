//
//  UIApplicationExtension.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import UIKit

extension UIApplication {
    public class func getCurrentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getCurrentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getCurrentViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getCurrentViewController(base: presented)
        }
        return base
    }
}
