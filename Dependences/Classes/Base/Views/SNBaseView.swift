//
//  SNBaseView.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/17.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import RxSwift

 class SNBaseView: UIView {

    let disposeBag = DisposeBag()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
        bindEvent()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static var defaultBgColor = UIColor(hexadecimal: 0xf4f4f4)

}

@objc extension SNBaseView {
    
    func setupView() { }
    
    func bindEvent() { }
}

extension SNBaseView {
    
    func f4background() {
        backgroundColor = SNBaseView.defaultBgColor
    }
}
