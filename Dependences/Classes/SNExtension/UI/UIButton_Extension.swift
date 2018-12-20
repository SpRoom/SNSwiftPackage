//
//  UIButton_Extension.swift
//  diandianzanumsers
//
//  Created by 楠 on 2017/6/9.
//  Copyright © 2017年 specddz. All rights reserved.
//

import UIKit


extension UIButton {
    
    public func set(imageName: String, for state: UIControl.State) {
        
        let img = UIImage(named: imageName)
        self.setImage(img, for: state)
        
    }
}
