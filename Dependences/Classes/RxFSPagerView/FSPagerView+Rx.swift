//
//  FSPagerView+Rx.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/25.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import FSPagerView

extension Reactive where Base: FSPagerView {
    
    /**
    Binds sequences of elements to table view rows.
    
    - parameter source: Observable sequence of items.
    - parameter cellFactory: Transform between sequence elements and view cells.
    - returns: Disposable object that can be used to unbind.
     
     Example:
    
         let items = Observable.just([
             "First Item",
             "Second Item",
             "Third Item"
         ])

         items
         .bind(to: tableView.rx.items) { (pagerView, row, element) in
             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
             cell.textLabel?.text = "\(element) @ row \(row)"
             return cell
         }
         .disposed(by: disposeBag)

     */
    public func items<S: Sequence, O: ObservableType>(_ source: O)
        -> (_ cellFactory: @escaping (FSPagerView, Int, S.Iterator.Element) -> FSPagerViewCell)
    -> Disposable
        where O.E == S {
            return { cellFactory in
                let dataSource = RxFSPagerViewReactiveArrayDataSourceSequenceWrapper<S>(cellFactory: cellFactory)
                return self.items(dataSource: dataSource)(source)
            }
    }
    
    /**
    Binds sequences of elements to table view rows.
    
    - parameter cellIdentifier: Identifier used to dequeue cells.
    - parameter source: Observable sequence of items.
    - parameter configureCell: Transform between sequence elements and view cells.
    - parameter cellType: Type of table view cell.
    - returns: Disposable object that can be used to unbind.
     
     Example:

         let items = Observable.just([
             "First Item",
             "Second Item",
             "Third Item"
         ])

         items
             .bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: FSPagerViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element) @ row \(row)"
             }
             .disposed(by: disposeBag)
    */
    public func items<S: Sequence, Cell: FSPagerViewCell, O: ObservableType>(cellIdentifier: String, cellType: Cell.Type = Cell.self)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, Cell) -> Void)
        -> Disposable where O.E == S {
            return { source in
                return { configureCell in
                let dataSource = RxFSPagerViewReactiveArrayDataSourceSequenceWrapper<S> { pager, index, item in
                    let indexPath = index
                    let cell = pager.dequeueReusableCell(withReuseIdentifier: cellIdentifier, at: indexPath) as! Cell
                    configureCell(index, item, cell)
                    return cell
                }
                    return self.items(dataSource: dataSource)(source)
                    
                }
            }
    }
    
    /**
    Binds sequences of elements to table view rows using a custom reactive data used to perform the transformation.
    This method will retain the data source for as long as the subscription isn't disposed (result `Disposable`
    being disposed).
    In case `source` observable sequence terminates successfully, the data source will present latest element
    until the subscription isn't disposed.
    
    - parameter dataSource: Data source used to transform elements to view cells.
    - parameter source: Observable sequence of items.
    - returns: Disposable object that can be used to unbind.
    */
    public func items<DataSource: RxFSPagerViewDataSourceType & FSPagerViewDataSource,
        O: ObservableType>
        (dataSource: DataSource)
        -> (_ source: O)
        -> Disposable
        where DataSource.Element == O.E {
        return { source in
            _ = self.delegate
            
//            return source.
            return source.subscribeProxyDataSource(ofObject: self.base, dataSource: dataSource as FSPagerViewDataSource, retainDataSource: true) { [weak pagerView = self.base] (_: RxFSPagerViewDataSourceProxy, event) -> Void in
                guard let pagerView = pagerView else { return }
                dataSource.pagerView(pagerView, observedEvent: event)
            }
        }
    }
}


extension Reactive where Base: FSPagerView {
    
    public typealias WillDisplayFSPagerViewCellEvent = (cell: FSPagerViewCell, at: Int)
    public typealias DidEndDisplayFSPagerViewCellEvent = (cell: FSPagerViewCell, at: Int)
    
    public var dataSource: DelegateProxy<FSPagerView, FSPagerViewDataSource> {
        return RxFSPagerViewDataSourceProxy.proxy(for: base)
    }
    
    public func setDataSource(_ dataSource: FSPagerViewDataSource) -> Disposable {
        return RxFSPagerViewDataSourceProxy.installForwardDelegate(dataSource, retainDelegate: false, onProxyForObject: self.base)
    }
    
    
    public var itemSelected: ControlEvent<Int> {
        let source = self.delegate.methodInvoked(#selector(FSPagerViewDelegate.pagerView(_:didSelectItemAt:)))
            .map { a in
                return try castOrThrow(Int.self, a[1])
            }

        return ControlEvent(events: source)
    }
    
    public var willDisplayCell: ControlEvent<WillDisplayFSPagerViewCellEvent> {
        let source: Observable<WillDisplayFSPagerViewCellEvent> = self.delegate.methodInvoked(#selector(FSPagerViewDelegate.pagerView(_:willDisplay:forItemAt:)))
            .map { a in
                return (try castOrThrow(FSPagerViewCell.self, a[1]), try castOrThrow(Int.self, a[2]))
            }

        return ControlEvent(events: source)
    }
    
    public var didEndDisplayingCell: ControlEvent<DidEndDisplayFSPagerViewCellEvent> {
           let source: Observable<DidEndDisplayFSPagerViewCellEvent> = self.delegate.methodInvoked(#selector(FSPagerViewDelegate.pagerView(_:didEndDisplaying:forItemAt:)))
               .map { a in
                   return (try castOrThrow(FSPagerViewCell.self, a[1]), try castOrThrow(Int.self, a[2]))
               }

           return ControlEvent(events: source)
       }
    
    public func modelSelected<T>(_ modelType: T.Type) -> ControlEvent<T> {
        let source: Observable<T> = self.itemSelected.flatMap { [weak view = self.base as FSPagerView] indexPath -> Observable<T> in
            guard let view = view else { return Observable.empty() }
            return Observable.just(try view.rx.model(at: indexPath))
        }
        return ControlEvent(events: source)
    }
    
    public func model<T>(at indexPath: Int) throws -> T {
        let dataSource: RowedFSPagerViewDataSourceType = castOrFatalError(self.dataSource.forwardToDelegate(), message: "This method only works in case one of the `rx.items*` methods was used.")
        
        let element = try dataSource.model(at: indexPath)

        return castOrFatalError(element)
    }
    
}


func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }

    return returnValue
}

func castOrFatalError<T>(_ value: AnyObject!, message: String) -> T {
    let maybeResult: T? = value as? T
    guard let result = maybeResult else {
        rxFatalError(message)
    }
    
    return result
}

func castOrFatalError<T>(_ value: Any!) -> T {
    let maybeResult: T? = value as? T
    guard let result = maybeResult else {
        rxFatalError("Failure converting from \(String(describing: value)) to \(T.self)")
    }
    
    return result
}

#if os(iOS) || os(tvOS)
    import UIKit

    extension ObservableType {
        func subscribeProxyDataSource<DelegateProxy: DelegateProxyType>(ofObject object: DelegateProxy.ParentObject, dataSource: DelegateProxy.Delegate, retainDataSource: Bool, binding: @escaping (DelegateProxy, Event<E>) -> Void)
            -> Disposable
            where DelegateProxy.ParentObject: UIView
            , DelegateProxy.Delegate: AnyObject {
            let proxy = DelegateProxy.proxy(for: object)
            let unregisterDelegate = DelegateProxy.installForwardDelegate(dataSource, retainDelegate: retainDataSource, onProxyForObject: object)
            // this is needed to flush any delayed old state (https://github.com/RxSwiftCommunity/RxDataSources/pull/75)
            object.layoutIfNeeded()

            let subscription = self.asObservable()
                .observeOn(MainScheduler())
                .catchError { error in
                    bindingError(error)
                    return Observable.empty()
                }
                // source can never end, otherwise it would release the subscriber, and deallocate the data source
                .concat(Observable.never())
                .takeUntil(object.rx.deallocated)
                .subscribe { [weak object] (event: Event<E>) in

                    if let object = object {
                        assert(proxy === DelegateProxy.currentDelegate(for: object), "Proxy changed from the time it was first set.\nOriginal: \(proxy)\nExisting: \(String(describing: DelegateProxy.currentDelegate(for: object)))")
                    }
                    
                    binding(proxy, event)
                    
                    switch event {
                    case .error(let error):
                        bindingError(error)
                        unregisterDelegate.dispose()
                    case .completed:
                        unregisterDelegate.dispose()
                    default:
                        break
                    }
                }
                
            return Disposables.create { [weak object] in
                subscription.dispose()
                object?.layoutIfNeeded()
                unregisterDelegate.dispose()
            }
        }
    }

#endif
