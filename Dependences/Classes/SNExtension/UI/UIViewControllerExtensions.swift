//
//  UIViewControllerExtensions.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/4/20.
//  Copyright © 2019 zsh. All rights reserved.
//

import UIKit

extension UIViewController {

    // vc 需要移除的viewcontroller
    public func removeNavi(vc: UIViewController? = nil) {
        guard let navigation = self.navigationController else {
            return
        }

        let oldViewControllers = navigation.viewControllers
        let viewControllers = oldViewControllers.filter({ $0 != vc })

        navigation.viewControllers = viewControllers
    }


    public func removeNaviMiddles() {

        guard let navigation = self.navigationController else {
            return
        }

        let oldViewControllers = navigation.viewControllers
        if let first = oldViewControllers.first {
            navigation.viewControllers = [first, self]
        } else {
            navigation.viewControllers = [self]
        }
    }

    public func backTwo() {

        guard let navigation = self.navigationController else {
            return
        }

        let oldViewControllers = navigation.viewControllers
        
        if oldViewControllers.count < 1 {
            return
        }
        
        var viewControllerIndex = oldViewControllers.count - 3
        if oldViewControllers.count <= 3 && oldViewControllers.count > 0 {
            viewControllerIndex = 0
        }

        navigation.popToViewController(oldViewControllers[viewControllerIndex], animated: true)

    }
}
