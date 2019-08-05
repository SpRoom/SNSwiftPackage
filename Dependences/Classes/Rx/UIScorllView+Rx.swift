//
//  UIScorllView+Rx.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/7.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIScrollView {

    public var contentOffsetX: Observable<CGFloat> {
        return contentOffset.flatMap({ (point) in
            return Observable.just(point.x)
        })
    }

}
