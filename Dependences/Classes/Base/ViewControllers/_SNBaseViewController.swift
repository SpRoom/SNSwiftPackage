//
//  DDZBaseViewController.swift
//  diandianzanumsers
//
//  Created by 楠 on 2017/6/10.
//  Copyright © 2017年 specddz. All rights reserved.
//

import UIKit
import RxSwift

open class _SNBaseViewController: UIViewController {
    
    
   public let disposeBag = DisposeBag()

   open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        baseConfig()
        basicStyle()
        setupView()
        bindEvent()
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func basicStyle() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
   open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        viewAppear(animated)
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewAppeared(animated)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewDisAppear(animated)
//        DDZSingleton.shared.isCancelLogin = false
    }

    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewDisAppeared(animated)
    }
    
    
   
}


extension _SNBaseViewController {
    
    func baseConfig() {
        SNLog("error")
    }
    
    /// 启动视图
    @objc open func setupView() {}
    
    /// 绑定事件
    @objc open func bindEvent() {}
    
    /// 初始化加载数据
    @objc open func loadData() {}
    
    /// 界面即将显示
    ///
    /// - Parameter animated: 是否动画
    @objc open func viewAppear(_ animated: Bool) {}
    
    /// 界面完成显示
    ///
    /// - Parameter animated: 是否动画
    @objc open func viewAppeared(_ animated: Bool) {}
   
    /// 界面即将消失
    ///
    /// - Parameter animated: 是否动画
    @objc open func viewDisAppear(_ animated: Bool) {}
    
    /// 界面完成消失
    ///
    /// - Parameter animated: 是否动画
    @objc open func viewDisAppeared(_ animated: Bool) {}
    
    
    
}

extension _SNBaseViewController {
    
    
    /*
    func setNaviBarColor(scroll: UIScrollView, titleView: UIView){
        
        let xa = scroll.contentOffset.y + 64 + 64 - fit( 340)
        
        let alpha = xa > 0 ? xa/64 : 0
        
        
        if alpha < 0.2{
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        }else{
            
            if alpha > 1.0{
                navigationController?.navigationBar.setBackgroundImage(createImageBy(color: color_main), for: .any, barMetrics: .default)
                
            }else{
                navigationController?.navigationBar.setBackgroundImage(createImageBy(color: ColorRGBA(red: 3, green: 159, blue: 255, alpha: alpha)), for: .any, barMetrics: .default)
            }
        }
    }
 */
    
    func popToHome() {

//        let tabbar = MainTabBarController.shared
//        tabbar.selectedIndex = 0
//
//        navigationController?.popToRootViewController(animated: true)
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    func f5backgroundcolor() {
        view.backgroundColor = UIColor(hexadecimal: 0xf5f5f5)
    }
}


