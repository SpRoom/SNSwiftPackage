//
//  BaseViewController.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/22.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import SNSwiftPackage
import RxCocoa

class BaseViewController: SNBaseViewController {
    
    let isHeaderLoading = BehaviorRelay(value: false)
    let isFooterLoading = BehaviorRelay(value: false)
    let isLoading = BehaviorRelay(value: false)
    
    let languageChanged = BehaviorRelay<Void>(value: ())
    
    init() {
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    var navigationTitle = "" {
//        didSet {
//            navigationItem.title = navigationTitle
//        }
//    }
    
    var automaticallyAdjustsLeftBarButtonItem = true
    
//    lazy var closeBarButton: UIBarButtonItem = {
//        let view = UIBarButtonItem(image: R.image.naviback(),
//                                   style: .plain,
//                                   target: self,
//                                   action: nil)
//        return view
//    }()
    
    var backBarButton: UIBarButtonItem = UIBarButtonItem().then {
        $0.title = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        closeBarButton.rx.tap
//            .subscribe(onNext: { [unowned self] () in
//                self.closeAction()
//            }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        if automaticallyAdjustsLeftBarButtonItem {
//            adjustLeftBarButtonItem()
//        }
        
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        logResourcesCount()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        SNLog("\(type(of: self)): Received Memory Warning")
    }
    
    deinit {
        SNLog("\(type(of: self)): Deinited")
        logResourcesCount()
    }
}

extension BaseViewController {
    
    override func setupView() {
        super.setupView()
        
        hero.isEnabled = true
        navigationItem.backBarButtonItem = backBarButton
        
        languageChanged.subscribe(onNext: { [weak self] () in
            // language changed, maybe need update empty show title
        }).disposed(by: disposeBag)
        
        
        updateUI()
    }
    
    /// because some change, need update UI
    func updateUI() {
        
    }
}

extension BaseViewController {
    
    // if screen occur rotation, delay 0.3 seconds update UI
    func orientationChanged() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.updateUI()
        }
    }
}

// adapter left bar button, deal with present or override push
extension BaseViewController {
    
//    func adjustLeftBarButtonItem() {
////        guard !isRoot else { return }
//        if self.navigationController?.viewControllers.count ?? 0 > 1 { // Pushed
//            self.navigationItem.leftBarButtonItem = nil
//        } else if self.presentingViewController != nil { // presented
//            self.navigationItem.leftBarButtonItem = closeBarButton
//        }
//    }
    
    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
