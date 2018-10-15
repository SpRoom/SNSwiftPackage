//
//  UIFont_Extension.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/6/27.
//  Copyright © 2018年 spectator Mr.Z. All rights reserved.
//

import UIKit

/// 字体
public func Font(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fit(size))
}


/// 加粗字体
public func BoldFont(_ size: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: fit(size))
}
