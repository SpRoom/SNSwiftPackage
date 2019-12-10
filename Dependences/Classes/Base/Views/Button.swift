//
//  Button.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/29.
//  Copyright © 2019 spectator. All rights reserved.
//

import UIKit
import RxSwift

class Button: UIButton {
    
    let disposeBag = DisposeBag()

     override init(frame: CGRect) {
           super.init(frame: frame)
           setupViews()
       }

       required public init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupViews()
       }

}

extension Button {

    @objc func setupViews() {

       
    }

}
