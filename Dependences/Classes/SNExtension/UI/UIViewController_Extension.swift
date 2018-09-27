//
//  UIViewController_Extension.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/9/27.
//  Copyright © 2018 spectator Mr.Z. All rights reserved.
//

import Foundation

extension UIViewController {
    
   public func push(_ vc: UIViewController, animated: Bool) {
        
        self.navigationController?.pushViewController(vc, animated: animated)
    }
}
