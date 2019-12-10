//
//  UILabel+Rx.swift
//  ytxIos
//
//  Created by x j z l on 2019/10/18.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
#if os(iOS) //|| os(tvOS)

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UILabel {
    /// Bindable sink for `layer.borderColor` property.
//    public var borderColor: Binder<UIColor?> {
//        return Binder(self.base) { view, color in
//            view.layer.borderColor = color?.cgColor
//        }
//    }
    
    public var lines: Binder<Int> {
        return Binder(base) { view, lines in
            view.numberOfLines = lines
        }
    }
    
}

#endif
