//
//  Dictonary_extension.swift
//  ShenZhouDaDiXing
//
//  Created by spectator Mr.Z on 2016/10/20.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import UIKit

extension Dictionary {
    
    /// 合并字典
    ///
    /// - Parameters:
    ///   - other: 需添加的字典
    ///   - instead: key重复是否用other中的value替换
    /// - Returns: 得到的字典
    public func merging(_ other: Dictionary, instead : Bool) -> Dictionary {
        
       let dic = self.merging(other) { (old, new) -> Value in
            if instead {
                return new
            } else {
                return old
            }
        }
        return dic
    }
    
    
    /// 合并字典并覆盖
    ///
    /// - Parameters:
    ///   - other: 需添加的字典
    ///   - instead: key重复是否用other中的value替换
    public mutating func merge(_ other: Dictionary, instead: Bool) {
        
        self.merge(other) { (old, new) -> Value in
            if instead {
                return new
            } else {
                return old
            }
        }
    }
}
