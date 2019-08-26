//
//  Logs.swift
//  Syntax-SNSwfitPackage
//
//  Created by zyt on 2018/12/20.
//  Copyright © 2018 zsh. All rights reserved.
//

import Foundation


public func SNLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
    var fileName = file as NSString
    
    fileName = fileName.lastPathComponent as NSString
    print("[\(Date().timeIntervalSince1970) \(fileName)--\(function)--\(line) : \(message)]")
    #endif
}
