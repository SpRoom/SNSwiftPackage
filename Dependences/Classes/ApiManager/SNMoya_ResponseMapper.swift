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
    public func map<T: SNSwiftyJSONAble>(to type:T.Type) throws -> T {
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {

            throw SNAPIError.notLoggedIn
        }

        
        guard jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE else {
//            return SNMoyaResult.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
            throw SNAPIError.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
        }

        guard let mappedObject = T(jsonData: jsonObj) else {
            throw SNAPIError.mappingError
        }

        return mappedObject
    }
    
    /// Maps data received from the signal into an array of objects which implement the SNSwiftyJSONAble protocol
    /// If the conversion fails, the signal errors.
    public func map<T: SNSwiftyJSONAble>(to type:[T.Type]) throws -> [T] {
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            
            throw SNAPIError.notLoggedIn
        }
        
        let mappedArray = jsonObj
        
      
        guard jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE else {
            throw SNAPIError.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
        }
        //        let mappedObjectsArray = mappedArray.arrayValue.flatMap { T(jsonData: $0) }
        let mappedObjectsArray = mappedArray.arrayValue.compactMap { T(jsonData: $0) }
        
        return mappedObjectsArray
    }
    
    public func mapToString() throws -> String {
        
        let jsonData = try JSON(data: self.data)
        
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            
            throw SNAPIError.notLoggedIn
        }
        
        if jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE {
            
            if let mapStr = jsonObj.string {
                return mapStr
            } else {
                throw SNAPIError.mappingError
            }
            
            
        } else {
            
            throw SNAPIError.fail(code: jsonCode.stringValue, msg: jsonMsg.stringValue)
        }
        
    }
    
    public func mapToNetModel() throws -> SNNetModel {
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            throw SNAPIError.notLoggedIn
        }
        
        guard let model = SNNetModel(jsonData: jsonData) else {

            throw SNAPIError.mappingError
        }
        
        return model
    }
    
    public func mapToModel<T: SNSwiftyJSONAble>() throws -> T {
        
        let jsonData = try JSON(data: self.data)
        SNLog(jsonData)
        
        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            throw SNAPIError.notLoggedIn
        }
        
        guard let model = T(jsonData: jsonData) else {
            throw SNAPIError.mappingError
        }
        
        return model
    }
    
    public func mapToBool() throws -> Bool {
        let jsonData = try JSON(data: self.data)
        
        let jsonCode = jsonData[SNAPIConfig.MOYA_RESULT_CODE]
//        let jsonObj = jsonData[SNAPIConfig.MOYA_RESULT_DATA]
//        let jsonMsg = jsonData[SNAPIConfig.MOYA_RESULT_MSG]

        if let token = jsonData[SNAPIConfig.MOYA_RESULT_TOKEN_KEY].string, token != SNAPIConfig.tokenAuth {
            
            throw SNAPIError.notLoggedIn
        }
        
        if jsonCode.stringValue == SNAPIConfig.MOYA_RESULT_SUCCESS_CODE {
            return true
        }
        
        return false
    }
    
    public func mapToJSON() throws -> JSON {
        
        let jsonData = try JSON(data: self.data)
        
        if jsonData == JSON.null {
            throw SNAPIError.mappingError
        }
        
        return jsonData
    }
}
