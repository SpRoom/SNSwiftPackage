//
//  Networking+Provider.swift
//  zshSeedOne
//
//  Created by zyt on 2018/12/24.
//  Copyright © 2018 zsh. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import SwiftyJSON

public extension MoyaProvider {

    func requestArray<T: SNSwiftyJSONAble>(target: Target, type: T.Type) -> Observable<[T]> {
        return rx.request(target).asObservable().map(to: [type.self])
    }

    func request<T: SNSwiftyJSONAble>(target: Target, type: T.Type) -> Observable<T> {
        return rx.request(target).asObservable().map(to: type.self)
    }

    func requestString(target: Target) -> Observable<String> {
        return rx.request(target).asObservable().mapToString()
    }

    func requestDefaultModel(target: Target) -> Observable<SNNetModel> {

        return rx.request(target).asObservable().mapToNetModel()
    }

    func requestCustomModel<T: SNSwiftyJSONAble>(target: Target, modelType: T.Type) -> Observable<T> {
        return rx.request(target).asObservable().mapToModel()
    }

    func requestBool(target: Target) -> Observable<Bool> {
        return rx.request(target).asObservable().mapToBool()
    }

    func requestJson(target: Target) -> Observable<JSON> {
        return rx.request(target).asObservable().mapToJSON()
    }

}

