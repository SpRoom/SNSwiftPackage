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

/// 添加导航栏按钮
///
/// - Parameters:
///   - naviItem: 需要添加按钮的 navgationItem
///   - target: selector 方法所有者
///   - action: 方法
///   - point: 添加位置 .right 右方  .left 左方
///   - title: 按钮文字/按钮图片
///   - titleColor: 按钮颜色
///   - titleFont: 按钮字体
/// - Returns: 生成的按钮对象
@discardableResult
public func naviButton(_ naviItem: UINavigationItem, target: Any?, action: Selector, point: SNNaviButtonPostion = .right, title: Any, titleColor: UIColor = .white, titleFont: UIFont = UIFont.systemFont(ofSize: 16)) -> UIButton? {

    var titleText: String?
    var titleImage: UIImage?

    if let text = title as? String {
        titleText = text
    }

    if let image = title as? UIImage {
        titleImage = image
    }

    guard titleText != nil || titleImage != nil else {
        return nil
    }

    let buttonRight = UIButton()
    if let text = titleText {
        buttonRight.setTitle(text, for: .normal)
    }
    if let image = titleImage {
        buttonRight.setImage(image, for: .normal)
    }

    buttonRight.setTitleColor(titleColor, for: .normal)
    buttonRight.titleLabel?.font = titleFont
    buttonRight.addTarget(target, action: action, for: .touchUpInside)
    buttonRight.sizeToFit()
    if point == .right {
        naviItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
    } else if point == .left {
        naviItem.leftBarButtonItem = UIBarButtonItem(customView: buttonRight)
    }

    return buttonRight
}


