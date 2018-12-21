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

struct TableSectionModel<T:SectionItemType> {
    var title: String
    var items: [T]
}

extension TableSectionModel : SectionModelType {
    
    typealias Item = T
    
    init(original: TableSectionModel, items: [Item]) {
        self = original
        self.items = items
    }
}
