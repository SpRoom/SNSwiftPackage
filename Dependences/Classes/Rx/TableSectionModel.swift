//
//  TableSectionModel.swift
//  changshoubao
//
//  Created by spectator Mr.Z on 2018/9/18.
//  Copyright © 2018年 Mr.Z. All rights reserved.
//

import UIKit
import RxDataSources

public protocol SectionItemType {
    
}

public struct TableSectionModel<T:SectionItemType> {
    public var title: String
    public var items: [T]
}

extension TableSectionModel : SectionModelType {
    
    public typealias Item = T
    
    public init(original: TableSectionModel, items: [Item]) {
        self = original
        self.items = items
    }
}
