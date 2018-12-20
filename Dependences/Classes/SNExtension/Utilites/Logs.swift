//
//  Logs.swift
//  Syntax-SNSwfitPackage
//
//  Created by zyt on 2018/12/20.
//  Copyright © 2018 zsh. All rights reserved.
//

import Foundation


public func SNLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
    
    var fileName = file as NSString
    
    fileName = fileName.lastPathComponent as NSString
    print("[\(fileName)--\(function)--\(line) : \(message)]")
}
