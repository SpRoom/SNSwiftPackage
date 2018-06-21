//
//  UINavigation_Extension.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/21.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit

enum SNNaviButtonPostion {
    case left
    case right
}

enum SNJumpType {
    case push
    case pop
    case present
    case dismiss
    case popToRoot
}

func naviButton(_ naviItem: UINavigationItem,  target: Any?, action: Selector, point: SNNaviButtonPostion = .right, title: String, titleColor: UIColor = .white) -> UIButton {
    
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

func VCJump(VC: UIViewController,to: UIViewController, type: SNJumpType, completion: (() -> Swift.Void)? = nil) {
    
    switch type {
    case .push:
        VC.navigationController?.pushViewController(to, animated: true)
    case .present:
       VC.present(to, animated: true, completion: completion)
    case .pop:
        VC.navigationController?.popViewController(animated: true)
    case .dismiss:
        VC.dismiss(animated: true, completion: completion)
    case .popToRoot:
        VC.navigationController?.popToRootViewController(animated: true)
    }
}
