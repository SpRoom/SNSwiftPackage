//
//  ObservableExtension.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Observable where Element: Equatable {
    func ignore(value: Element) -> Observable<Element> {
        return filter { (selfE) -> Bool in
            return value != selfE
        }
    }
}


extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<E> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<E> {
        return asDriver { error in
            assertionFailure("Error \(error)")
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
