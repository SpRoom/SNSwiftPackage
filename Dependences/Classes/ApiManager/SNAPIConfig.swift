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
    
    public static var tokenAuth = ""
    
    public static func configKeyMoyaResultCode(_ str: String) {
        MOYA_RESULT_CODE = str
    }
    
    public static func configKeyMoyaResultMsg(_ str: String) {
        MOYA_RESULT_MSG = str
    }
    
    public static func configKeyMoyaResultData(_ str: String) {
        MOYA_RESULT_DATA = str
    }
    
    public static func configResultKey(code: String = "code", msg: String = "msg", data: String = "data", status: String = "1000") {
        MOYA_RESULT_CODE = code
        MOYA_RESULT_MSG = msg
        MOYA_RESULT_DATA = data
        MOYA_RESULT_SUCCESS_CODE = status
    }
}
