//
//  UISwitch+Rx.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/2.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public extension Reactive where Base: UISwitch {

     var onTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.onTintColor = attr
        }
    }

     var thumbTintColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.thumbTintColor = attr
        }
    }
}
