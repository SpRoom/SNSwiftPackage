

//
//  MJRrefresh.swift
//  SNSwiftpackage
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

#if canImport(MJRefresh)
import MJRefresh

extension Reactive where Base: MJRefreshComponent {

    public var isAnimating: Binder<Bool> {
        return Binder(self.base) { control, active in
            if active {
                control.beginRefreshing()
            } else {
                control.endRefreshing()
            }
        }
    }
}
#endif
