//
//  HeroModalExtension.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import Hero

extension UIViewController {
    
    public func hero(modal vc: UIViewController, animationType: HeroDefaultAnimationType) {
        
        vc.hero.modal(aniamtionType: animationType)
        
        present(vc, animated: true, completion: nil)
    }
    
}

extension HeroExtension where Base: UIViewController {
    
    func modal(aniamtionType: HeroDefaultAnimationType) {
        
        base.hero.isEnabled = true
        base.hero.modalAnimationType = aniamtionType
        switch aniamtionType {
        case .fade:
            base.modalPresentationStyle = .overFullScreen
        default:
            break
        }
        
    }
}
