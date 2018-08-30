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
    public func snBottomSuperview(vc: UIViewController,_ file: String = #file, _ line: UInt = #line) -> SnapKit.ConstraintMakerEditable {
        
        if #available(iOS 11, *) {
            return self.equalTo(vc.view.safeAreaLayoutGuide.snp.bottom)
        } else {
            return self.equalTo(vc.bottomLayoutGuide.snp.bottom)
        }
    }
    
}
