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

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Methods
public extension UINavigationController {

    /// SwifterSwift: Pop ViewController with completion handler.
    ///
    /// - Parameters:
    ///   - animated: Set this value to true to animate the transition (default is true).
    ///   - completion: optional completion handler (default is nil).
    func popViewController(animated: Bool = true, _ completion: (() -> Void)? = nil) {
        // https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }

    /// SwifterSwift: Push ViewController with completion handler.
    ///
    /// - Parameters:
    ///   - viewController: viewController to push.
    ///   - completion: optional completion handler (default is nil).
    func pushViewController(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
        // https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: true)
        CATransaction.commit()
    }

    /// SwifterSwift: Make navigation controller's navigation bar transparent.
    ///
    /// - Parameter tint: tint color (default is .white).
    func makeTransparent(withTint tint: UIColor = .white) {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.tintColor = tint
        navigationBar.titleTextAttributes = [.foregroundColor: tint]
    }

}

#endif
