//
//  SNAPIConfig.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/6/27.
//  Copyright © 2018年 spectator Mr.Z. All rights reserved.
//

import Foundation

public class SNAPIConfig {
    
    
    private(set) static var MOYA_RESULT_CODE = "code"
    private(set) static var MOYA_RESULT_MSG = "msg"
    private(set) static var MOYA_RESULT_DATA = "data"
    private(set) static var MOYA_RESULT_SUCCESS_CODE = "1000"
    private(set) static var MOYA_RESULT_TOKEN_KEY = "token"
    private(set) static var MOYA_REQUEST_HEADER_TOKEN_KEY = "X-AUTH-TOKEN"

    public static var tokenAuth = ""

    public static var header_key: String {
        return MOYA_REQUEST_HEADER_TOKEN_KEY
    }

    public static var success_code: String {
        return MOYA_RESULT_SUCCESS_CODE
    }
    
    public static func configKeyMoyaResultCode(_ str: String) {
        MOYA_RESULT_CODE = str
    }
    
    public static func configKeyMoyaResultMsg(_ str: String) {
        MOYA_RESULT_MSG = str
    }
    
    public static func configKeyMoyaResultData(_ str: String) {
        MOYA_RESULT_DATA = str
    }
    
    public static func configResultKey(codeKey: String = "code", msgKey: String = "msg", dataKey: String = "data", successCode: String = "1000", tokenKey: String = "X-AUTH-TOKEN") {
        MOYA_RESULT_CODE = codeKey
        MOYA_RESULT_MSG = msgKey
        MOYA_RESULT_DATA = dataKey
        MOYA_RESULT_SUCCESS_CODE = successCode
        MOYA_REQUEST_HEADER_TOKEN_KEY = tokenKey
    }
}
