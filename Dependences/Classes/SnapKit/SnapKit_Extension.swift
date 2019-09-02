//
//  SnapKit_Extension.swift
//  diandianzanumsers
//
//  Created by 楠 on 2017/6/11.
//  Copyright © 2017年 specddz. All rights reserved.
//

import Foundation
import SnapKit


extension ConstraintMakerEditable {
    @discardableResult
    public func snOffset(_ amount: CGFloat) -> SnapKit.ConstraintMakerEditable {
        self.offset(fit(amount))
        return self
    }

    @discardableResult
    public func snInset(_ amount: CGFloat) -> SnapKit.ConstraintMakerEditable {
        self.inset(fit(amount))
        return self
    }
    
}

extension ConstraintMakerRelatable {
    
    @discardableResult
    public func snEqualTo(_ other: ConstraintRelatableTarget, _ file: String = #file, _ line: UInt = #line) -> ConstraintMakerEditable {
        if let other = other as? ConstraintConstantTarget {
            let value = CGFloat(truncating: other as! NSNumber)
            return self.equalTo(fit(value), file, line)
        } else {
            
            return self.equalTo(other, file, line)
        }
    }
    
    @discardableResult
    public func snEqualToSuperview(_ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        return self.equalToSuperview(file, line)
    }
    
    @discardableResult
    public func snTopSuperview(vc: UIViewController,_ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        
        if #available(iOS 11, *) {
            return self.equalTo(vc.view.safeAreaLayoutGuide.snp.top)
        } else {
            return self.equalTo(vc.topLayoutGuide.snp.bottom)
        }
    }
    
    @discardableResult
    public func snTopLessThanSuperview(vc: UIViewController, _ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.lessThanOrEqualTo(vc.view.safeAreaLayoutGuide.snp.top)
        } else {
            return self.lessThanOrEqualTo(vc.topLayoutGuide.snp.bottom)
        }
    }
    
    @discardableResult
    public func snTopGreaterThanSuperview(vc: UIViewController, _ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.greaterThanOrEqualTo(vc.view.safeAreaLayoutGuide.snp.top)
        } else {
            return self.greaterThanOrEqualTo(vc.topLayoutGuide.snp.bottom)
        }
    }
    
    @discardableResult
    public func snBottomSuperview(vc: UIViewController,_ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        
        if #available(iOS 11, *) {
            return self.equalTo(vc.view.safeAreaLayoutGuide.snp.bottom)
        } else {
            return self.equalTo(vc.bottomLayoutGuide.snp.top)
        }
    }
    
    @discardableResult
    public func snBottomLessThanSuperview(vc: UIViewController,_ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.lessThanOrEqualTo(vc.view.safeAreaLayoutGuide.snp.bottom)
        } else {
            return self.lessThanOrEqualTo(vc.bottomLayoutGuide.snp.top)
        }
    }
    
    @discardableResult
    public func snBottomGreaterThanSuperview(vc: UIViewController, _ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        if #available(iOS 11, *) {
            return self.greaterThanOrEqualTo(vc.view.safeAreaLayoutGuide.snp.bottom)
        } else {
            return self.greaterThanOrEqualTo(vc.bottomLayoutGuide.snp.top)
        }
    }
    
}

public extension ConstraintMaker {
    
    func positionCenterY() {
        self.centerY.snEqualToSuperview()
    }
    
    func positionCenterX() {
        self.centerX.snEqualToSuperview()
    }
    
    func center() {
        self.center.snEqualToSuperview()
    }
    
    func height(_ height: CGFloat) {
        self.height.snEqualTo(height)
    }
    
    func width(_ width: CGFloat) {
        self.width.snEqualTo(width)
    }
    
    func size(_ width: ConstraintRelatableTarget, _ height: ConstraintRelatableTarget) {
        self.width.snEqualTo(width)
        self.height.snEqualTo(height)
    }
    
    func position(left: CGFloat? = nil, top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) {
        if let target = top {
            self.top.snEqualToSuperview().snOffset(target)
        }
        if let target = left {
            self.left.snEqualToSuperview().snOffset(target)
        }
        if let target = right {
            self.right.snEqualToSuperview().snOffset(target)
        }
        if let target = bottom {
            self.bottom.snEqualToSuperview().snOffset(target)
        }
    }
}
