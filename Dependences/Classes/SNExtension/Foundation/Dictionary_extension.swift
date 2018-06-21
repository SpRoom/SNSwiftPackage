//
//  Dictonary_extension.swift
//  ShenZhouDaDiXing
//
//  Created by spectator Mr.Z on 2016/10/20.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import UIKit

extension Dictionary {
    
    mutating func append(dictionary:Dictionary) {
        for (key, value) in dictionary {
            self[key] = value
        }
    }
}
