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

open class SNBaseViewModel: NSObject {
   public let disposeBag = DisposeBag()
   public let jumpSubject = PublishSubject<(UIViewController?, SNJumpType)>()
    public var isCanJumpLogin = true
    public let endRefresh = PublishSubject<Bool>()
    override public init() {
        super.init()
        
        loading()
    }

}

extension SNBaseViewModel {
    
   @objc open func loading() {
        
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

public func VCJump(VC: UIViewController,to: UIViewController?, type: SNJumpType, completion: (() -> Swift.Void)? = nil) {
    
    switch type {
    case .push:
        VC.navigationController?.pushViewController(to!, animated: true)
    case .present:
        VC.present(to!, animated: true, completion: completion)
    case .pop:
        VC.navigationController?.popViewController(animated: true)
    case .dismiss:
        VC.dismiss(animated: true, completion: completion)
    case .popToRoot:
        VC.navigationController?.popToRootViewController(animated: true)
    }
}
