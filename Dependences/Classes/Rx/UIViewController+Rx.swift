//
//  UIViewController+Rx.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/2.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public extension Reactive where Base: UIViewController {

    var navibarTintColor: Binder<UIColor> {
        return Binder(self.base) { control, attr in
            control.navigationController?.navigationBar.barTintColor = attr
        }
    }

    var navibarTitleColor: Binder<UIColor> {
        return Binder(self.base) { control, attr in
            let colorAttr = [NSAttributedString.Key.foregroundColor: attr]
            control.navigationController?.navigationBar.titleTextAttributes = colorAttr
        }
    }

    var tabbarTitleColorForNormal: Binder<UIColor> {
        return Binder(self.base) { control, attr in
            let colorAttr = [NSAttributedString.Key.foregroundColor: attr]
            control.tabBarItem.setTitleTextAttributes(colorAttr, for: .normal)
        }
    }

    var tabbarTitleColorForSelected: Binder<UIColor> {
        return Binder(self.base) { control, attr in
            let colorAttr = [NSAttributedString.Key.foregroundColor: attr]
            control.tabBarItem.setTitleTextAttributes(colorAttr, for: .selected)
        }
    }

    var tabbarTitleColor: Binder<(UIColor, UIControl.State)> {
        return Binder(self.base) { control, attr in
            let colorAttr = [NSAttributedString.Key.foregroundColor: attr.0]
            control.tabBarItem.setTitleTextAttributes(colorAttr, for: attr.1)
        }
    }
}
