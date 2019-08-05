//
//  KafkaRefreshRx.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
#if canImport(KafkaRefresh)
import KafkaRefresh

extension Reactive where Base: KafkaRefreshControl {
    
    public var isAnimating: Binder<Bool> {
        return Binder(self.base) { refreshControl, active in
            if active {
                //                refreshControl.beginRefreshing()
            } else {
                refreshControl.endRefreshing()
            }
        }
    }
}
#endif
