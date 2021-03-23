//
//  RxFSPagerViewDelegateProxy.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/26.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import FSPagerView

extension FSPagerView: HasDelegate {
    public typealias Delegate = FSPagerViewDelegate
}

extension Reactive where Base: FSPagerView {

    public var delegate: DelegateProxy<FSPagerView, FSPagerViewDelegate> {
        return RxFSPagerViewDelegateProxy.proxy(for: base)
    }
}



open class RxFSPagerViewDelegateProxy: DelegateProxy<FSPagerView, FSPagerViewDelegate>, DelegateProxyType, FSPagerViewDelegate {
    
    public static func registerKnownImplementations() {
        self.register { RxFSPagerViewDelegateProxy(pagerView: $0) }
    }

    public weak private(set) var pagerView: FSPagerView?

    public init(pagerView: ParentObject) {
        self.pagerView = pagerView
        super.init(parentObject: pagerView, delegateProxy: RxFSPagerViewDelegateProxy.self)
    }


}
