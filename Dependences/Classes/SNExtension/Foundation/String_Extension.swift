//
//  String_Extension.swift
//  ShenZhouDaDiXing
//
//  Created by Spectator on 2016/11/15.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import Foundation

extension String {
    
    /// 获取某个位置的字符串
    ///
    /// - Parameter at: 位置
    /// - Returns: 返回要获取的值
    func value(at: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: at)
        let boolStr = self[index]
        return "\(boolStr)"
    }
    
    
    /// 截取两个位置之间的值
    ///
    /// - Parameters:
    ///   - star: 开始位置
    ///   - end: 结束位置
    /// - Returns: 获取的字符串
    func substring(star: Int, end: Int) -> String {
        let new = self[self.startIndex.advance(star, for: self)..<self.startIndex.advance(end, for: self)]
        let newStr = String(new)
        return newStr
    }
}

extension String.Index{
    
    func successor(in string:String)->String.Index{
        return string.index(after: self)
    }
    
    func predecessor(in string:String)->String.Index{
        return string.index(before: self)
    }
    
    /// 获取字符串某个位置的index
    func advance(_ offset:Int, `for` string:String)->String.Index{
        return string.index(self, offsetBy: offset)
    }
}
