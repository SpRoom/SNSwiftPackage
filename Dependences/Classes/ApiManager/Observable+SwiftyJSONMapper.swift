//
//  Observable+SwiftyJSONMapper.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/6.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import SwiftyJSON

/// Extension for processing Responses into Mappable objects through ObjectMapper
public extension ObservableType where E == Response {
    
    /// Maps data received from the signal into an object which implements the ALSwiftyJSONAble protocol.
    /// If the conversion fails, the signal errors.
    public func map<T: SNSwiftyJSONAble>(to type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.map(to: type))
        }
    }
    
    /// Maps data received from the signal into an array of objects which implement the ALSwiftyJSONAble protocol.
    /// If the conversion fails, the signal errors.
    public func map<T: SNSwiftyJSONAble>(to type: [T.Type]) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.map(to: type))
        }
    }
    
    public func mapToString() -> Observable<String> {
        return flatMap({ response -> Observable<String> in
            return Observable.just(try response.mapToString())
        })
    }
    
    public func mapToNetModel() -> Observable<SNNetModel> {
        return flatMap({ response -> Observable<SNNetModel> in
            return Observable.just(try response.mapToNetModel())
        })
    }
    
    public func mapToModel<T: SNSwiftyJSONAble>() -> Observable<T> {
        return flatMap({ response -> Observable<T> in
            return Observable.just(try response.mapToModel())
        })
    }
    
    public func mapToBool() -> Observable<Bool> {
        return flatMap({ response -> Observable<Bool> in
            return Observable.just(try response.mapToBool())
        })
    }
    
    public func mapToJSON() -> Observable<JSON> {
        return flatMap({ (response) -> Observable<JSON> in
            return Observable.just(try response.mapToJSON())
        })
    }
}
