//
//  ViewController.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/22.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import SNSwiftPackage
import MGJRouter_Swift
import EFNavigationBar

public let kMGJRouterNavigationViewController = "MGJRouterNavigationViewController"
public let kMGJRouterViewController = "kMGJRouterViewController"
public let kMGJRouterCompleteNextStep = "compelteHandler"
public let kMGJRouterNextStepType = "jump"
public let kMGJRouterNextStepUri = "uri"
public let kMGJRouterNaviRemoveLast = "removeNavLast"

class ViewController: BaseViewController {
    
    let manager = TransitionManager()
    lazy var navBar = EFNavigationBar.CustomNavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
            debugConfig()
        #endif
    }
    
    #if DEBUG
    func debugConfig() {
        
    }
    #endif
    
    override init() {
        super.init()
        
        modalPresentationStyle = .fullScreen
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ViewController {
    
    override var isViewLoaded: Bool {
//        SNLog("isViewLoaded - \(super.isViewLoaded)")
        if super.isViewLoaded && isCurrentVisibleOnIsViewLoaded() {
//        SNLog("isCurrentVCVisible - \(isCurrentVisibleOnIsViewLoaded())")
            naviReset()
        }
        
        return super.isViewLoaded
    }
    
    @objc func naviReset() {}
    
    override func setupView() {
        super.setupView()
        
    }
    
    override func bindEvent() {
        super.bindEvent()
        
        // MGJRouter_Swift 跳转实现
        if let viewModel = checkHasViewModel() {
            viewModel.routerSubject.subscribe(onNext: { [unowned self] (url, type, param, handler) in
                switch type {
                case .push:
                    var param = param
                    param[kMGJRouterNavigationViewController] = self.navigationController
                    MGJRouter.open(url, param, handler)
                case .present:
                    var param = param
                    param[kMGJRouterViewController] = self
                    MGJRouter.open(url, param, handler)
                default:
                    VCJump(VC: self, to: nil, type: type, completion: { [unowned self] in
                        self.nextStepAction(param: param)
                    })
                }
            }).disposed(by: disposeBag)
            
            viewModel.jumpSubject.subscribe(onNext: { [unowned self] (vc, type) in
                VCJump(VC: self, to: vc, type: type)
                }).disposed(by: disposeBag)
        }
        
    }
  /*
     MGJRouter_Swift
     */
  
    private func nextStepAction(param: [String: Any]) {
        guard let vc = topViewController() else { return }
        if let viewModel = vc.checkHasViewModel() {
            if let dic = param[kMGJRouterCompleteNextStep] as? [String: Any] {
                if let uri = dic[kMGJRouterNextStepUri] as? String, let type = dic[kMGJRouterNextStepType] as? SNJumpType {
                    viewModel.routerSubject <= (uri, type, [:], nil)
                }
            }
        }
    }

}


extension UIViewController {
    
     func topViewController(base: UIViewController? = nil) -> UIViewController? {
        if base == nil {
            return topViewController(base: UIApplication.shared.keyWindow?.rootViewController)
        }
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
    
    func checkHasViewModel(named: String = "viewModel") -> ViewModel? {
        let mir = Mirror(reflecting: self)
        let children = mir.children
        for (name, object) in children {
            guard name == named else {
                continue
            }
            if let vmodel = object  as? ViewModel {
                return vmodel
            }
        }
        return nil
    }
}
