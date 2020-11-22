//
//  RxFSPagerViewReactiveArrayDataSource.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/25.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import FSPagerView
import RxCocoa
import RxSwift

class _RxFSPagerViewReactiveArrayDataSource: NSObject, FSPagerViewDataSource {
    
    func _numberOfItems(in pagerView: FSPagerView) -> Int {
        return 0
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return _numberOfItems(in: pagerView)
    }
    
    func _pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
            rxAbstractMethod()
        }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        return _pagerView(pagerView, cellForItemAt: index)
    }
}


class RxFSPagerViewReactiveArrayDataSourceSequenceWrapper<S: Sequence>
        : RxFSPagerViewReactiveArrayDataSource<S.Iterator.Element>,
          RxFSPagerViewDataSourceType {
    
    typealias Element = S
    
    override init(cellFactory: @escaping CellFactory) {
        super.init(cellFactory: cellFactory)
    }
    
    func pagerView(_ pagerView: FSPagerView, observedEvent: Event<S>) {
        Binder(self) { pagerViewDataSource, rowModels in
            let rows = Array(rowModels)
            pagerViewDataSource.pagerView(pagerView, observedElements: rows)
        }.on(observedEvent)
    }
}

// Please take a look at `DelegateProxyType.swift`
class RxFSPagerViewReactiveArrayDataSource<Element>: _RxFSPagerViewReactiveArrayDataSource, RowedFSPagerViewDataSourceType {
    
    typealias CellFactory = (FSPagerView, Int, Element) -> FSPagerViewCell
    
    var itemModels: [Element]?
    
    func modelAtIndex(_ index: Int) -> Element? {
        return itemModels?[index]
    }
    
    func model(at indexPath: Int) throws -> Any {
//        precondition(indexPath == 0)
        guard let item = itemModels?[indexPath] else {
            throw RxCocoaError.itemsNotYetBound(object: self)
        }
        return item
    }
    
    let cellFactory: CellFactory
    
    init(cellFactory: @escaping CellFactory) {
        self.cellFactory = cellFactory
    }
    
    // data source
    override func _numberOfItems(in pagerView: FSPagerView) -> Int {
        return itemModels?.count ?? 0
    }
    
    
    override func _pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        return cellFactory(pagerView, index, itemModels![index])
    }
    
    // reactive
    func pagerView(_ pagerView: FSPagerView, observedElements: [Element]) {
        self.itemModels = observedElements
        
        pagerView.reloadData()
    }
    
}
