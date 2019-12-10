//
//  TransitionManager.swift
//  zshSeedOne
//
//  Created by spec on 16/7/14.
//  Copyright © 2016年 spec. All rights reserved.
//

import UIKit
import SNSwiftPackage

class TransitionManager: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    private var isPresent: Bool = false
    private var presentFrame: CGRect = CGRect.zero
    
    /// orignFrame / anchorPoint 必有一项, anchorPoint
    /// 动画从 orignFrame -> presentFrame 或者 presentFrame 根据 anchorPoint,view.transform从0到1变化
    
    /// 两者都有值，则取 anchorPoint
    private var orignView: UIView?

    private var endFrame: CGRect?
    private var isTapExit = true
    private var bgColor: UIColor?
    private var direct: Dircetion?

    enum Dircetion {
        case bottom
        case right
    }
    
    // 初始化
    func setTransform(endFrame: CGRect? = nil, presentFrame: CGRect, direct: Dircetion = .bottom, bgColor: UIColor? = nil, isTapExit: Bool = true) {
        
        self.presentFrame = presentFrame // 控制器frame
        self.endFrame = endFrame // 结束动画
        self.isTapExit = isTapExit
        self.bgColor = bgColor
        self.direct = direct
    }
    private func setframe(orignView: UIView, present: CGRect) {
        self.orignView = orignView
        self.presentFrame = present
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }

    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let present = PopPresentatuinController.init(presentedViewController: presented, presenting: presenting)
            present.presentFrame = presentFrame
        if let back = bgColor {
            present.set(backgroundColor: back)
        }
            present.isTapExit = isTapExit
        return present
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            willPresentedController(transitionContext: transitionContext)

        } else {
            willDismissController(transitionContext: transitionContext)
        }

    }
 

    
    /// 执行展现动画
    private func willPresentedController(transitionContext: UIViewControllerContextTransitioning) {

        //获取view
        if let view  = transitionContext.view(forKey: UITransitionContextViewKey.to) {

            let endFrame = view.frame

            var startFrame = endFrame

            var direction = Dircetion.bottom
            if let dirc = direct {
                direction = dirc
            }

            switch direction {
            case .bottom:
                startFrame.origin.y = ScreenH
            case .right:
                startFrame.origin.x = ScreenW
            }
            transitionContext.containerView.addSubview(view)
            view.frame = startFrame

            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                view.frame = endFrame
            }, completion: { _ in
                transitionContext.completeTransition(true)
            })
        }

    }
    private func willDismissController(transitionContext: UIViewControllerContextTransitioning) {

        //获取view
        if let view  = transitionContext.view(forKey: UITransitionContextViewKey.from) {

            let startFrame = view.frame

            var endFrame = startFrame

            var direction = Dircetion.bottom
            if let dirc = direct {
                direction = dirc
            }

            switch direction {
            case .bottom:
                endFrame.origin.y = ScreenH
            case .right:
                endFrame.origin.x = ScreenW
            }

            view.frame = startFrame

            if let frame = self.endFrame {
                endFrame = frame
            } 

            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                view.frame = endFrame
            }, completion: { _ in
                transitionContext.completeTransition(true)
            })
        }
    }

}
