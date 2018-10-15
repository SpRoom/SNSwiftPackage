//
//  SNMoya_ResponseMapper.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/5.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON


public extension Response {
    
    /// Maps data received from the signal into an object which implements the SNSwiftyJSONAble protocol.
    /// If the conversion fails, the signal errors.
    public func map<T: SNSwiftyJSONAble>(to type:T.Type) throws -> SNMoyaResult<T> {
        //        let jsonObject = try mapJSON()
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]
        
        if let token = jsonData["token"].string, token != SNAPIConfig.tokenAuth {
            
            print("token核对失败，请重新登录")
            //            return SNMoyaResult.fail(code: "99", msg: "token核对失败，请重新登录")
            return SNMoyaResult.login
        }
        
        //        let jsonObject = jsonObj.object
        //        guard let mappedObject = T(jsonData: jsonData/*JSON(jsonObject)*/) else {
        //            throw MoyaError.jsonMapping(self)
        //            return SNMoyaResult.fail(code: jsonCode.int, msg: jsonMsg.string)
        //        }
        
        //        guard jsonCode.int != 1080 && jsonCode.int != 1006 else {
        //            let navi = getCurrentNavi()
        //            navi?.pushViewController(DDZLoginViewController(), animated: true)
        //            return SNMoyaResult.fail(code: 0000, msg: "登录过期，请重新登录")
        //        }
        
        guard jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE, let mappedObject = T(jsonData: jsonObj) else {
            return SNMoyaResult.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
        }
        
        
        
        //        return mappedObject
        return SNMoyaResult.success(mappedObject)
    }
    
    /// Maps data received from the signal into an array of objects which implement the SNSwiftyJSONAble protocol
    /// If the conversion fails, the signal errors.
    public func map<T: SNSwiftyJSONAble>(to type:[T.Type]) throws -> SNMoyaResult<[T]> {
        //        let jsonObject = try mapJSON()
        let jsonData = try JSON(data: self.data)
        //        let mappedArray = JSON(jsonObject)
        SNLog(jsonData)
        
        assert(SNAPIConfig.MOYA_RESULT_CODE != "", "请设置网络返回状态码的key")
        
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]
        
        if let token = jsonData["token"].string, token != SNAPIConfig.tokenAuth {
            
            print("token核对失败，请重新登录")
            return SNMoyaResult.login
        }
        
        let mappedArray = jsonObj
        
        //        guard jsonCode.int != 1080 && jsonCode.int != 1006 else {
        //            let navi = getCurrentNavi()
        //            navi?.pushViewController(DDZLoginViewController(), animated: true)
        //            return SNMoyaResult.fail(code: 0000, msg: "登录过期，请重新登录")
        //        }
        
        //错误处理
        //        guard jsonCode.int == 1000 else {
        //
        //            return SNMoyaResult.fail(code: jsonCode.int, msg: jsonMsg.string)
        //        }
        guard jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE else {
            return SNMoyaResult.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
        }
        //        let mappedObjectsArray = mappedArray.arrayValue.flatMap { T(jsonData: $0) }
        let mappedObjectsArray = mappedArray.arrayValue.compactMap { T(jsonData: $0) }
        
        return SNMoyaResult.success(mappedObjectsArray)
    }
    
    public func mapToString() throws -> SNMoyaResult<String> {
        
        let jsonData = try JSON(data: self.data)
        
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]
        
        //        guard jsonCode.int == 1000, let mappedString = jsonObj.string else {
        //            //throw SNMoyaError.fail(code: nil, msg: jsonMsg.string)
        //            return SNMoyaResult.fail(code: jsonCode.int, msg: jsonMsg.string)
        //        }
        guard jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE, let mappedString = jsonObj.string else {
            return SNMoyaResult.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
        }
        return SNMoyaResult.success(mappedString)
    }
    
    public func mapToNetModel() throws -> SNMoyaResult<SNNetModel> {
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        guard let model = SNNetModel(jsonData: jsonData) else {
            throw MoyaError.jsonMapping(self)
        }
        //        guard model.code == 1000 else {
        //            return SNMoyaResult.fail(code: model.code, msg: model.msg)
        //        }
        //        guard jsonCode.string == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE, let mappedObject = T(jsonData: jsonObj) else {
        //            return SNMoyaResult.fail(code: jsonCode.string, msg: jsonMsg.string)
        //        }
        return SNMoyaResult.success(model)
    }
    
    public func mapToModel<T: SNSwiftyJSONAble>() throws -> SNMoyaResult<T> {
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        guard let model = T(jsonData: jsonData) else {
            return SNMoyaResult.fail(code: "9999", msg: "数据错误")
        }
        
        return SNMoyaResult.success(model)
    }
    
    public func mapToBool() throws -> SNMoyaResult<Bool> {
        let jsonData = try JSON(data: self.data)
        
        guard let model = SNNetModel(jsonData: jsonData) else {
            throw MoyaError.jsonMapping(self)
        }
        guard model.code == 1000 else {
            return SNMoyaResult.fail(code: "model.code", msg: model.msg)
        }
        return SNMoyaResult.bool(msg: model.msg)
    }
    
    public func mapToJSON() throws -> SNMoyaResult<JSON> {
        
        let jsonData = try JSON(data: self.data)
        
        if jsonData == JSON.null {
            return SNMoyaResult.fail(code: "1099", msg: "数据为空")
        }
        
        return SNMoyaResult.success(jsonData)
    }
}
