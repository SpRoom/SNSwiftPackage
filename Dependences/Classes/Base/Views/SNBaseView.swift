//
//  SNBaseView.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/17.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import RxSwift

open class SNBaseView: UIView {

   public let disposeBag = DisposeBag()
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
        bindEvent()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static var defaultBgColor = UIColor(hexadecimal: 0xf4f4f4)

}

@objc extension SNBaseView {
    
  open  func setupView() { }
    
   open func bindEvent() { }
}

extension SNBaseView {
    
    func f4background() {
        backgroundColor = SNBaseView.defaultBgColor
    }
}

extension SNBaseView : ReusableView {
}
