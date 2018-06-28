//
//  DDZBaseViewModel.swift
//  diandianzanumsers
//
//  Created by 楠 on 2017/6/10.
//  Copyright © 2017年 specddz. All rights reserved.
//

import UIKit
import RxSwift

public enum SNJumpType {
    case push
    case pop
    case present
    case dismiss
    case popToRoot
}

public class SNBaseViewModel: NSObject {
    let disposeBag = DisposeBag()
    let jumpSubject = PublishSubject<(UIViewController, SNJumpType)>()
    
    override init() {
        super.init()
        
        loading()
    }

}

extension SNBaseViewModel {
    
   @objc public func loading() {
        
    }
    
//    func validToLogin(code: Int?, backType: DDZLoginViewController.PopType) {
//
//        if code == 1006 || code == 1080 {
//            let vc = DDZLoginViewController()
//            vc.backType = backType
//            self.jumpSubject.onNext((vc, SNJumpType.push))
//        }
//
//    }
    
//    func needLogin(error: SNNetError) {
//
//        if error == .needLogin {
//
//            let loginSingle = DDZSingleton.shared
//
//            if loginSingle.isCancelLogin {
//
//            } else {
//
//                let vc = DDZLoginViewController()
//                jumpSubject.onNext((vc, .push))
//            }
//        }
//    }
}
