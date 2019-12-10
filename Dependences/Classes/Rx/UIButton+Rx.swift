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

#if os(iOS)

import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base: UIButton {
    
    /// Reactive wrapper for `TouchUpInside` control event.
//    public var tap: ControlEvent<Void> {
//        return controlEvent(.touchUpInside)
//    }
    
    public var tapDriver: Driver<Void> {
        return tap.asDriver()
    }
}

extension UIButton {

    public var snTap: Observable<Void> {

        return self.rx.tap.throttle(0.8, latest: false, scheduler: MainScheduler.instance)

    }
}

extension UIButton {
    
    public func mapTapToDriver() -> Driver<Void> {
        return self.rx.tapDriver
    }
}
#endif
