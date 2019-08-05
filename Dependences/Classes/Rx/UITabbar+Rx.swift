//
//  UITabbar.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/2.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public extension Reactive where Base: UITabBarItem {

    var defTextColor: Binder<UIColor> {
        return Binder(self.base) { view, attr in
            let colorAttr = [NSAttributedString.Key.foregroundColor: attr]
            view.setTitleTextAttributes(colorAttr, for: .normal)
        }
    }

    var selTextColor: Binder<UIColor> {
        return Binder(self.base) { view, attr in
            let colorAttr = [NSAttributedString.Key.foregroundColor: attr]
            view.setTitleTextAttributes(colorAttr, for: .selected)
        }
    }

    
}
