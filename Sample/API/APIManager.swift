//
//  APIManager.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/6.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import RxSwift
import SwiftyJSON


func APIRequest<T : SNSwiftyJSONAble>(requestType: APIExp, modelType: [T.Type]) -> Observable<[T]> {
    return APIProvider.rx.request(requestType).asObservable().map(to: modelType.self)
}


func APIRequest<T : SNSwiftyJSONAble>(requestType: APIExp, modelType: T.Type) -> Observable<T> {
    return APIProvider.rx.request(requestType).asObservable().map(to: modelType.self)
}


func APIRequest(requestType: APIExp) -> Observable<String> {
    return APIProvider.rx.request(requestType).asObservable().mapToString()
}


func APIRequestModel(requestType: APIExp) -> Observable<SNNetModel> {
    
    return APIProvider.rx.request(requestType).asObservable().mapToNetModel()
}

func APIRequestModel<T : SNSwiftyJSONAble>(requestType: APIExp, modelType: T.Type) -> Observable<T> {
    return APIProvider.rx.request(requestType).asObservable().mapToModel()
}

func APIRequestBool(requestType: APIExp) -> Observable<Bool> {
    return APIProvider.rx.request(requestType).asObservable().mapToBool()
}

func APIRequestJSON(requestType: APIExp) -> Observable<JSON> {
    return APIProvider.rx.request(requestType).asObservable().mapToJSON()
}

