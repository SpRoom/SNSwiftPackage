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


func APIRequest<T : SNSwiftyJSONAble>(requestType: API, modelType: [T.Type]) -> Observable<SNMoyaResult<[T]>> {
    return APIProvider.request(requestType).asObservable().map(to: modelType.self)
}


func APIRequest<T : SNSwiftyJSONAble>(requestType: API, modelType: T.Type) -> Observable<SNMoyaResult<T>> {
    return APIProvider.request(requestType).asObservable().map(to: modelType.self)
}


func APIRequest(requestType: API) -> Observable<SNMoyaResult<String>> {
    return APIProvider.request(requestType).asObservable().mapToString()
}


func APIRequestModel(requestType: API) -> Observable<SNMoyaResult<SNNetModel>> {
    
    return APIProvider.request(requestType).asObservable().mapToNetModel()
}

func APIRequestModel<T : SNSwiftyJSONAble>(requestType: API, modelType: T.Type) -> Observable<SNMoyaResult<T>> {
    return APIProvider.request(requestType).asObservable().mapToModel()
}

func APIRequestBool(requestType: API) -> Observable<SNMoyaResult<Bool>> {
    return APIProvider.request(requestType).asObservable().mapToBool()
}

func APIRequestJSON(requestType: API) -> Observable<SNMoyaResult<JSON>> {
    return APIProvider.request(requestType).asObservable().mapToJSON()
}
