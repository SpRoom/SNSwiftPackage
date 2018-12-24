//
//  SNSwiftyJSONAble.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/3.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import SwiftyJSON
import Moya

public protocol SNSwiftyJSONAble {
    init?(jsonData:JSON)
}

public protocol JSONMappableTargetType: TargetType {
    var responseType: SNSwiftyJSONAble.Type { get }
}


public extension JSONMappableTargetType {
    
    func headerJSONToken(token: String? = nil) -> [String: String] {

        var header = [
            "Content-Type": "application/json; charset=utf-8"
        ]

        if let token = token {
        header[SNAPIConfig.header_key] = "\(token)"
        }
        return header
    }

    func headerJSON() -> [String: String] {

        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]

        return header
    }

    func taskPostResult(parameters: [String: Any]? = nil) -> Task {

        let dic = coverToDic()
        if dic.isEmpty {
            return .requestPlain
        } else {
            return .requestParameters(parameters: dic, encoding: JSONEncoding.default)
        }
    }

    func taskGetResult(parameters: [String: Any]? = nil) -> Task {

        let dic = coverToDic()
        if dic.isEmpty {
            return .requestPlain
        } else {
            return .requestParameters(parameters: dic, encoding: URLEncoding.default)
        }
    }

    public func covertToDic() -> [String: Any] {

        var para: [String: Any] = [:]

        let mir = Mirror(reflecting: self)

        for tuple in mir.children {
            let tupleMir =  Mirror(reflecting: tuple.value)

            for (key, val) in tupleMir.children {
                if let key = key {
                    para[key] = val
                } else if let vkey = val as? String {
                    para[vkey] = val
                }
            }

        }

        return para
    }


    func coverToDic() -> [String: Any] {

        var para: [String: Any] = [:]

        let mir = Mirror(reflecting: self)


        for (_, tval) in mir.children {
            let tupleMir =  Mirror(reflecting: tval)

            //            if let _ = tupleMir.displayStyle {

            for (key, val) in tupleMir.children {
                if let key = key {

                    if let val1 = val as? String {
                        para[key] = val1
                    } else if let val1 = val as? Int {

                        para[key] = val1
                    } else if let val1 = val as? TimeInterval {
                        para[key] = val1
                    } else {
                        //                        para[key] = val
                    }

                } else if let vkey = val as? String {
                    para[vkey] = vkey
                }
            }
            //            } else {
            //                let val = tval
            //                if let key = tkey {
            //                    para[key] = val
            //                } else if let vkey = val as? String {
            //                    para[vkey] = val
            //                }
            //            }

        }

        return para
    }
}
