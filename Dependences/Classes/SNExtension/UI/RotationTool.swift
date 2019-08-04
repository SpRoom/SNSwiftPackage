//
//  RotationTool.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/5/21.
//  Copyright © 2019 zsh. All rights reserved.
//

import CoreGraphics
import UIKit


struct RotationTool {

    public static func rotation(for view: UIView, fromValue: CGFloat = 0, toValue: CGFloat = CGFloat.pi * 2, autoreverses: Bool = false, repeatCount: Float = MAXFLOAT, duration: TimeInterval = 12, key: String? = nil) {

        // 1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")

        // 2.设置动画的属性
        rotationAnim.fromValue = fromValue
        rotationAnim.toValue = toValue
        rotationAnim.repeatCount = repeatCount
        rotationAnim.duration = duration
        rotationAnim.autoreverses = autoreverses
        // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止
        rotationAnim.isRemovedOnCompletion = false

        // 3.将动画添加到layer中
        view.layer.add(rotationAnim, forKey: key)
    }

    public static func rotationOnce(for view: UIView, fromValue: CGFloat = 0, toValue: CGFloat = CGFloat.pi * 2, duration: TimeInterval) {
        // 1.创建动画
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")

        // 2.设置动画的属性
        rotationAnim.fromValue = fromValue
        rotationAnim.toValue = toValue
        rotationAnim.repeatCount = 1
        rotationAnim.duration = duration
        // 这个属性很重要 如果不设置当页面运行到后台再次进入该页面的时候 动画会停止
        rotationAnim.isRemovedOnCompletion = false

        // 3.将动画添加到layer中
        view.layer.add(rotationAnim, forKey: nil)
    }

}
