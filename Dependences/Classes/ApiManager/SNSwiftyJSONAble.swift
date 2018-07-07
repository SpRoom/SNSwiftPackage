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


extension JSONMappableTargetType {
    
   public func covertToDic() -> Dictionary<String,Any> {
        
        var para : [String: Any] = [:]
        
        let mir = Mirror(reflecting: self)
        
        
        for tuple in mir.children {
            let tupleMir =  Mirror(reflecting: tuple.value)
            
            for (key,val) in tupleMir.children {
                if let key = key {
                    para[key] = val
                } else if let vkey = val as? String {
                    para[vkey] = val
                }
            }
            
        }
        
        return para
    }
}
