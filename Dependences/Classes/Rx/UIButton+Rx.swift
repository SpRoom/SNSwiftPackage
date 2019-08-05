//
//  UIButton+Rx.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/9.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIButton {
    public var textColor: Binder<UIColor> {
        return Binder(self.base) { view, attr in
            view.setTitleColor(attr, for: .normal)
        }
    }
}
