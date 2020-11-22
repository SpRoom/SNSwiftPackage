//
//  RowedViewDataSourceType.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/25.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation

/// Data source with access to underlying sectioned model.
public protocol RowedFSPagerViewDataSourceType {
    /// Returns model at index path.
    ///
    /// In case data source doesn't contain any sections when this method is being called, `RxCocoaError.ItemsNotYetBound(object: self)` is thrown.

    /// - parameter indexPath: Model index path
    /// - returns: Model at index path.
    func model(at indexPath: Int) throws -> Any
}
