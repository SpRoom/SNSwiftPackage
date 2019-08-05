//
//  UITableView+Rx.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/2.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UITableView {

    public var separatorColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.separatorColor = attr
        }
    }
}
