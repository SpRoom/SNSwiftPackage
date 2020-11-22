//
//  RxPagerViewDataSourceProxy.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/25.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import FSPagerView

// MARK: Error messages

let dataSourceNotSet = "DataSource not set"
let delegateNotSet = "Delegate not set"

extension FSPagerView: HasDataSource {
    public typealias DataSource = FSPagerViewDataSource
}

fileprivate let pagerViewDataSourceNotSet = FSPagerViewDataSourceNotSet()

fileprivate final class FSPagerViewDataSourceNotSet: NSObject, FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 0
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        rxAbstractMethod(message: dataSourceNotSet)
    }
    
    
}

open class RxFSPagerViewDataSourceProxy: DelegateProxy<FSPagerView, FSPagerViewDataSource>, DelegateProxyType, FSPagerViewDataSource {

    public weak private(set) var pagerView: FSPagerView?
    
    public init(pagerView: FSPagerView) {
        self.pagerView = pagerView
        
        super.init(parentObject: pagerView, delegateProxy: RxFSPagerViewDataSourceProxy.self)
    }
    
    public static func registerKnownImplementations() {
        self.register { RxFSPagerViewDataSourceProxy(pagerView: $0) }
    }
    
    fileprivate weak var _requiredMethodsDataSource: FSPagerViewDataSource? = pagerViewDataSourceNotSet
    
    // delegate
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return (_requiredMethodsDataSource ?? pagerViewDataSourceNotSet).numberOfItems(in: pagerView)  //.numberOfItems(in: pagerView)
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        return (_requiredMethodsDataSource ?? pagerViewDataSourceNotSet).pagerView(pagerView, cellForItemAt: index)
    }
    
    open override func setForwardToDelegate(_ delegate: FSPagerViewDataSource?, retainDelegate: Bool) {
        _requiredMethodsDataSource = delegate ?? pagerViewDataSourceNotSet
        super.setForwardToDelegate(delegate, retainDelegate: retainDelegate)
    }

}

