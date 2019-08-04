//
//  ViewFloat.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/5/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIView {

    public func animationUpDown() {

        let viewLayer: CALayer? = self.layer
        let position: CGPoint? = viewLayer?.position
        let fromPoint = CGPoint(x: position?.x ?? 0.0, y: position?.y ?? 0.0)
        var toPoint = CGPoint.zero

        let typeInt: UInt32 = arc4random() % 100
        var distanceFloat: CGFloat = 0.0
        while distanceFloat == 0 {
            distanceFloat = CGFloat(Double((6 + Int(arc4random() % (9 - 7 + 1)))) * 100.0 / 101.0)
        }
        if typeInt % 2 == 0 {
            toPoint = CGPoint(x: position?.x ?? 0.0, y: (position?.y ?? 0.0) - distanceFloat)
        } else {
            toPoint = CGPoint(x: position?.x ?? 0.0, y: (position?.y ?? 0.0) + distanceFloat)
        }

        let animation = CABasicAnimation(keyPath: "position")
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fromValue = NSValue(cgPoint: fromPoint)
        animation.toValue = NSValue(cgPoint: toPoint)
        animation.autoreverses = true
        var durationFloat: CGFloat = 0.0
        while durationFloat == 0.0 {
            durationFloat = CGFloat(0.9 + Double(Int(arc4random() % (100 - 70 + 1))) / 31.0)
        }
        animation.duration = CFTimeInterval(durationFloat)
        animation.repeatCount = MAXFLOAT

        viewLayer?.add(animation, forKey: "float")
    }
}


extension Array where Element: UIView {

    public func animationUpDown() {
        forEach { $0.animationUpDown() }
    }
}
