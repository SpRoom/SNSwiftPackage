//
//  TableViewModel.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/23.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import SNSwiftPackage
import RxCocoa
import RxDataSources
import RxSwift

typealias TablePageModel = SNSwiftyJSONAble
class TableSectionViewModel<CellItem: SectionItemType, ApiModel: SNSwiftyJSONAble, PageModel: SNSwiftyJSONAble>: ViewModel {
    typealias PageApiModel = PageModel
    typealias ListApiModel = ApiModel
    typealias Item = CellItem
    typealias TableSectionType = TableSectionModel<Item>
    typealias DataSourceType = RxTableViewSectionedReloadDataSource<TableSectionType>
    
    var noMoreDataSubject = PublishSubject<Bool>()
    let reloadSubject = PublishSubject<Void>()
    
    var tableSource: BehaviorRelay<[TableSectionType]> = BehaviorRelay(value: [])
    
    
    /// 模型转换 --> 重写此方法
    ///
    /// - Parameter item: Api 模型对象
    /// - Returns: cell 模型对象
    func map(item: ListApiModel) -> Item? {
        
        return nil
    }
}

extension TableSectionViewModel {
    
    /// 分页处理
    ///
    /// - Parameter page: page对象
    /// - Returns: table 数据模型数组
    func deal(page: PageApiModel) -> [Item] {
        
//        let newItems: [Item] = page.list.map(map(item:)).compactMap({ $0 })

        return []
    }
}


extension TableSectionViewModel {
    
    /// 是否没有更多数据
    ///
    /// - Parameter refresh: true 最后一页 没有更多数据  false 下拉刷新 重置数据  nil 中间数据，不做操作
    func table(footer refresh: Bool?) {
        if let update = refresh {
            noMoreDataSubject <= update
        }
    }
    
    
    /// table 数据刷新
    ///
    /// - Parameters:
    ///   - items: 获取到的并已经转换好数据类型的数据数组
    ///   - isAppend: true 上拉刷新 添加数据   false 下拉刷新 重置数据
    func tableSource(refresh items: [Item], isAppend: Bool) {
        
        if isAppend {
            let oldItems = tableSource.value[0].items
            let newItems = oldItems + items
            
            tableSource <= [TableSectionType(items: newItems)]
        } else {
            
            tableSource <= [TableSectionType(items: items)]
        }
    }
}


class TableEasyViewModel<Item: CellViewModel>: TableViewModel {
    typealias Item = Item
    let tableSource = BehaviorRelay<[Item]>(value: [])
    
    /// tableSource 数据更新
    /// - Parameter items: 请求解析回来的数据对象
    func receive(items: [Item]) {
        if page == 1 {
            tableSource <= items
        } else {
            tableSource += items
        }
    }
    
    func refresh(items: [Item]) {
        tableSource <= items
    }
    
    func trackLoading(observe: Observable<[Item]>) -> Observable<[Item]> {
        if page == 1 {
            return observe.trackActivity(headerLoading)
        } else {
            return observe.trackActivity(footerLoading)
        }
    }
}


class TableViewModel: ViewModel {
    func firstPage() {
        page = 1
    }
    
    func nextPage() {
        page += 1
    }
    
    func parsePage<T>(pageModel: PageListApiModel<T>) -> [T] {
        let noMore = pageModel.list.count < pageCount
        
        tableNoMore <= noMore
        return pageModel.list
    }
    
    
}

import SwiftyJSON
struct PageListApiModel<T: SNSwiftyJSONAble>: SNSwiftyJSONAble {

    var currPage: Int!
    var list: [T]!
    var pageSize: Int!
    var totalCount: Int!
    var totalPage: Int!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init?(jsonData: JSON) {
        if jsonData.isEmpty {
            return
        }
        currPage = jsonData["currPage"].intValue
        list = jsonData["list"].arrayValue.compactMap {
            T(jsonData: $0)
        }
        pageSize = jsonData["pageSize"].intValue
        totalCount = jsonData["totalCount"].intValue
        totalPage = jsonData["totalPage"].intValue
    }

}
