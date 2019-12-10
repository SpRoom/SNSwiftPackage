//
//  AnimationSectionItemType.swift
//  ytxIos
//
//  Created by x j z l on 2019/10/23.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation

#if canImport(RxDataSources)
import RxDataSources

public protocol AnimationSectionItemType {
    
}

public typealias AnimationSectionModelType = AnimationSectionItemType & IdentifiableType & Equatable

public struct AnimationTableSectionModel<T: AnimationSectionItemType & IdentifiableType & Equatable> {
    var header: String?
    public var items: [T]
}

extension AnimationTableSectionModel: AnimatableSectionModelType {
    
    public init(original: AnimationTableSectionModel, items: [T]) {
        self = original
        self.items = items
    }
    
    public typealias Item = T
    
    public var identity: String { return self.header ?? "AnimationTableSection" }
}
#endif
