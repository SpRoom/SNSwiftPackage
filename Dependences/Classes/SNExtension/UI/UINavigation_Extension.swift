//
//  UINavigation_Extension.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/21.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit

public enum SNNaviButtonPostion {
    case left
    case right
}

@discardableResult
public func naviButton(_ naviItem: UINavigationItem,  target: Any?, action: Selector, point: SNNaviButtonPostion = .right, title: String, titleColor: UIColor = .white) -> UIButton {
    
    let buttonRight = UIButton()
    buttonRight.setTitle(title, for: .normal)
    buttonRight.setTitleColor(titleColor, for: .normal)
    buttonRight.titleLabel?.font = UIFont.systemFont(ofSize: fit( 30))
    buttonRight.addTarget(target, action: action, for: .touchUpInside)
    buttonRight.sizeToFit()
    if point == .right {
        naviItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
    } else if point == .left {
        naviItem.leftBarButtonItem = UIBarButtonItem(customView: buttonRight)
    }
    
    return buttonRight
}


