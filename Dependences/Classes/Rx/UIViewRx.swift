//
//  UIViewRx.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// rx extensions
extension Reactive where Base: UIView {
    
    var backgroundColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.backgroundColor = attr
        }
    }
    
    var borderColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.borderColor = attr
        }
    }
}
