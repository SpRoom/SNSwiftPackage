//
//  PopPresentatuinController.swift
//  zshSeedOne
//
//  Created by spec on 16/7/14.
//  Copyright © 2019年 spec. All rights reserved.
//

import UIKit
import SNSwiftPackage

class PopPresentatuinController: UIPresentationController {
    var presentFrame: CGRect = CGRect.zero
    
    var isTapExit = true

    func set(backgroundColor: UIColor) {
        downCoverBtn.backgroundColor = backgroundColor
    }

    override func containerViewWillLayoutSubviews() {
        presentedView!.frame = presentFrame
        
//        containerView?.insertSubview(upCoverBtn, at: 0)
        containerView?.insertSubview(downCoverBtn, at: 0)
        downCoverBtn.addTarget(self, action: #selector(coverBtnClick), for: UIControl.Event.touchUpInside)
//        upCoverBtn .addTarget(self, action: #selector(coverBtnClick), for: UIControlEvents.touchUpInside)
    }
    @objc private func coverBtnClick() {

        if isTapExit {

        presentedViewController.resignFirstResponder()

        presentedViewController.dismiss(animated: true, completion: nil)
        
        }
    }
    // MARK: - 懒加载
    private lazy var downCoverBtn: UIButton = {
        let btn = UIButton.init(frame: CGRect(x: 0, y: 0, width: ScreenW, height: ScreenH))
        btn.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return btn
    }()
    
    
//    private lazy var upCoverBtn : UIButton = {
//        let btn = UIButton.init(frame: CGRect(x: 0, y: 0, width: ScreenW, height: 64))
//        btn.backgroundColor = UIColor.clear
//        return btn
//    }()
    

}
