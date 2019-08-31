//
//  NSObjectExtensions.swift
//  Alamofire
//
//  Created by x j z l on 2019/8/26.
//

import Foundation

public extension NSObject {
    
    class var nameOfClass: String {
        return String(describing: self)
    }

    var nameOfClass: String {
        return String(describing: type(of: self))
    }
}
