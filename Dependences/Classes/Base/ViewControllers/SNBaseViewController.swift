//
//  DDZBaseViewController.swift
//  diandianzanumsers
//
//  Created by 楠 on 2017/6/10.
//  Copyright © 2017年 specddz. All rights reserved.
//

import UIKit
import RxSwift

open class SNBaseViewController: UIViewController {
    
    
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
    
    
    // 空数据图
    fileprivate var noDataView = SNBaseNoDataView()
    
    
    var noDataViewImageName = "" {
        didSet {
            noDataView.imgV.image = Image(noDataViewImageName)
        }
    }
    
    var noDataViewDesc = "" {
        didSet {
            noDataView.descL.text = noDataViewDesc
        }
    }
    
    var showNoDataView = false {
        didSet {
            if showNoDataView {
                self.view.bringSubview(toFront: noDataView)
                noDataView.isHidden = false
            } else {
                self.view.insertSubview(noDataView, at: 0)
                noDataView.isHidden = true
            }
        }
    }
}


extension SNBaseViewController {
    
    func baseConfig() {
        
        view.addSubview(noDataView)
        
        noDataView.snp.makeConstraints { (make) in
            make.edges.snEqualToSuperview()
        }
        
        noDataView.isHidden = true
    }
    
    /// 启动视图
    @objc open func setupView() {}
    
    /// 帮顶事件
    @objc open func bindEvent() {}
    
    /// 初始化加载数据
    @objc open func loadData() {}
    
    /// 界面即将显示
    ///
    /// - Parameter animated: 是否动画
    @objc func viewAppear(_ animated: Bool) {}
    
    /// 界面完成显示
    ///
    /// - Parameter animated: 是否动画
    @objc func viewAppeared(_ animated: Bool) {}
   
    /// 界面即将消失
    ///
    /// - Parameter animated: 是否动画
    @objc func viewDisAppear(_ animated: Bool) {}
    
    /// 界面完成消失
    ///
    /// - Parameter animated: 是否动画
    @objc func viewDisAppeared(_ animated: Bool) {}
    
    
    
}

extension SNBaseViewController {
    
    
    func noData(show: Bool,desc: String="暂时没有数据", blankImageName: String="nothing") {
        
        self.noDataViewImageName = blankImageName
        self.noDataViewDesc = desc
        self.showNoDataView = show
    }
    
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

class SNBaseNoDataView : SNBaseView {
    
    let imgV = UIImageView().then {
        $0.image = Image("nothing")
    }
    let descL = UILabel().then {
        $0.textColor = Color(0x8f8f8f)
        $0.text = "暂无数据 休息一下"
//        obj.textColor = UIColor(hexadecimal: 0x878787)
        $0.font = Font(22)
    }
}

extension SNBaseNoDataView {
    
    override func setupView() {
        
        addSubview(imgV)
        addSubview(descL)
        backgroundColor = SNBaseView.defaultBgColor
        
        imgV.snp.makeConstraints { (make) in
            make.bottom.snEqualTo(self.snp.centerY).snOffset(-100)
//            make.width.height.snEqualTo(300)
            make.centerX.snEqualToSuperview()
        }
        
        descL.snp.makeConstraints { (make) in
            make.top.snEqualTo(imgV.snp.bottom).snOffset(40)
            make.centerX.snEqualToSuperview()
        }
        
    }
}
