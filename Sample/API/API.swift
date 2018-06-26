//
//  API.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/6.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import Moya
import RxSwift


let APIProvider = MoyaProvider<APIExp>()

enum APIExp {
    case login(username: String, pwd: String)
}

extension APIExp : JSONMappableTargetType {
    
    
    var responseType: SNSwiftyJSONAble.Type {
        return SNNetModel.self
    }
    
    var baseURL: URL {
        return URL(string:"http://test.oseepay.com")!
    }
    
    var path: String {
        return "api/testlogin"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data(base64Encoded: "")!
    }
    
    var task: Task {
        switch self {
        case .login(let username,let pwd):
            let para = [
                "username": username,
                "password": pwd
            ]
            return .requestParameters(parameters: para, encoding: URLEncoding.default)
            
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}



//var userToken = ""
//var headerFields = ["TOKEN": userToken]

//let testAPIProvider = RxMoyaProvider<API>(stubClosure: MoyaProvider.immediatelyStub)
//let APIProvider = RxMoyaProvider<API>()
//let APIProvider = MoyaProvider<API>()
/*
enum API {
 // Example
// MARK: - 登录
   // case login(username: String, password: String)

}
*/
/*
extension API: JSONMappableTargetType {
    
    var baseURL: URL {
        switch self {
        case .login:
            return URL(string: "http://0.0.0.0:8080")!
        default:
            return URL(string: "https://0.0.0.0:8080")!
        }
}
    
    var path: String {
        switch self {
        case .login:
            return "/login/validateCredentials"
        }
        
        
        
    }
    
    var headers: [String : String]? {
        switch self {
        case .login(let username,let password):
            return ["TOKEN":"\(username):\(password)"]
        case .userInfo:
            let token = UserDefaults.standard.string(forKey: 'key')
            SNLog(token)
            return ["X-AUTH-TOKEN":token ?? ""]
        default:
            return nil
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .get
        default:
            return .post
        }
        
    }
    
   
    
//    var sampleData: Data {
//        switch self {
//        case .user:
//            return stubbedResponseFromJSONFile(filename: "array_response")
//        default:
//            return "".data(using: .utf8)!
//        }
//    }
    
    // Then add an additional request method
    // Is not working:
    //func requestType<T:ALSwiftyJSONAble>(target: ExampleAPI) -> SignalProducer<T, Moya.Error> {
    //    return RCStubbedProvider.request(target).mapObject(target.responseType)
    //}
    // invalid
    var responseType: SNSwiftyJSONAble.Type {
        switch self {
        case .login:
            return SNNetModel.self
        default:
            return SNNetModel.self
        }
    }

    
    var task: Task {
        
        switch self {
        case .verfyRegisterSMS(let mobile), .verfyForgetPassSMS(let mobile),.verfyModifyPassSMS(let mobile),.activeMember(let mobile),.authPhoneCode(let mobile):
            let para = [
                "mobile" : mobile
            ]
            return .requestParameters(parameters: para, encoding: URLEncoding.default)

        default:
            return Task.requestPlain
        }
        
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}
 
 */

/*
// 读取本地json文件
private func stubbedResponseFromJSONFile(filename: String, inDirectory subpath: String = "", bundle:Bundle = Bundle.main ) -> Data {
    guard let path = bundle.path(forResource: filename, ofType: "json", inDirectory: subpath) else { return Data() }

    if let dataString = try? String(contentsOfFile: path), let data = dataString.data(using: String.Encoding.utf8){
        return data
    } else {
        return Data()
    }
}
 
 */
