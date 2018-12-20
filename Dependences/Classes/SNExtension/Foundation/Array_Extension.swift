//
//  Array_Extension.swift
//  ShenZhouDaDiXing
//
//  Created by spectator Mr.Z on 2016/11/4.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import UIKit

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    public mutating func remove(object: Element) {
        self = self.filter { $0 != object }
//        if let index = index(of: object) {
//            remove(at: index)
//        }
    }
}

extension Array where Element == String {
    
    /// 数组转字符串
    ///
    /// - Parameter char: 数组间隔符
    /// - Returns: 得到的字符串
    public func string(_ char: String) -> String {
        
        return self.joined(separator: char)
    }
    
//    func convertToStr(By: String) -> String {
    
//       let result = self.joined(separator: ",")
       
//        return result
//    }
}

