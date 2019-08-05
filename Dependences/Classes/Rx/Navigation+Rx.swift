//
//  Navigation+Rx.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/2.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UINavigationItem {

    

    
}

extension Reactive where Base: UINavigationBar {

    @available(iOS 11.0, *)
    public var largeTitleTextAttributes: Binder<[NSAttributedString.Key: Any]?> {
        return Binder(self.base) { view, attr in
            view.largeTitleTextAttributes = attr
        }
    }
}
