//
//  FSPagerSectionedViewDataSourceType.swift
//  ytxIos
//
//  Created by x j z l on 2019/11/5.
//  Copyright © 2019 spectator. All rights reserved.
//

/// Data source with access to underlying sectioned model.
public protocol FSPagerSectionedViewDataSourceType {
    /// Returns model at index path.
    ///
    /// In case data source doesn't contain any sections when this method is being called, `RxCocoaError.ItemsNotYetBound(object: self)` is thrown.

    /// - parameter indexPath: Model index path
    /// - returns: Model at index path.
    func model(at indexPath: Int) throws -> Any
}
