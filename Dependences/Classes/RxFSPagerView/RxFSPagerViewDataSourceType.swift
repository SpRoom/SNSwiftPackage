//
//  RxPagerViewDataSourceType.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/25.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import FSPagerView
import RxSwift

/// Data source with access to underlying sectioned model.
public protocol RxFSPagerViewDataSourceType {
    associatedtype Element
    
    /// - parameter indexPath: Model index path
    /// - returns: Model at index path.
   func pagerView(_ pagerView: FSPagerView, observedEvent: Event<Element>)
}
