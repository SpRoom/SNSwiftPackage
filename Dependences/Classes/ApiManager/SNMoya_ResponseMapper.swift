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
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            
            print("token核对失败，请重新登录")
            return SNMoyaResult.login
        }

        
        guard jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE, let mappedObject = T(jsonData: jsonObj) else {
            return SNMoyaResult.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
        }
        return SNMoyaResult.success(mappedObject)
    }
    
    /// Maps data received from the signal into an array of objects which implement the SNSwiftyJSONAble protocol
    /// If the conversion fails, the signal errors.
    public func map<T: SNSwiftyJSONAble>(to type:[T.Type]) throws -> SNMoyaResult<[T]> {
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            
            print("token核对失败，请重新登录")
            return SNMoyaResult.login
        }
        
        let mappedArray = jsonObj
        
      
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
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            
            return SNMoyaResult.login
        }
        
        if jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE {
            
            if let mapStr = jsonObj.string {
                return SNMoyaResult.success(mapStr)
            } else {
                return SNMoyaResult.fail(code: "sn_parse_string_fail", msg: "parse string failed")
            }
            
            
        } else {
            
            return SNMoyaResult.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
        }
        
    }
    
    public func mapToNetModel() throws -> SNMoyaResult<SNNetModel> {
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            return SNMoyaResult.login
        }
        
        guard let model = SNNetModel(jsonData: jsonData) else {
//            throw MoyaError.jsonMapping(self)
            return SNMoyaResult.fail(code: "sn_parse_model_fail", msg: "parse default net model failed")
        }
        
        return SNMoyaResult.success(model)
    }
    
    public func mapToModel<T: SNSwiftyJSONAble>() throws -> SNMoyaResult<T> {
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            return SNMoyaResult.login
        }
        
        guard let model = T(jsonData: jsonData) else {
            return SNMoyaResult.fail(code: "sn_parse_custom_model_fail", msg: "pase custom model failed")
        }
        
        return SNMoyaResult.success(model)
    }
    
    public func mapToBool() throws -> SNMoyaResult<Bool> {
        let jsonData = try JSON(data: self.data)
        
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
//        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            
            return SNMoyaResult.login
        }
        
        if jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE {
            return SNMoyaResult.bool(msg: jsonMsg.stringValue)
        }
        
        return SNMoyaResult.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
    }
    
    public func mapToJSON() throws -> SNMoyaResult<JSON> {
        
        let jsonData = try JSON(data: self.data)
        
        if jsonData == JSON.null {
            return SNMoyaResult.fail(code: "sn_parse_data_is_null", msg: "parse data is empty")
        }
        
        return SNMoyaResult.success(jsonData)
    }
}
