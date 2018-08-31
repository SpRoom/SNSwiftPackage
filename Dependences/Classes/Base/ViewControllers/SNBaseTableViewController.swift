//
//  DDZBasicTableVC.swift
//  geoTest
//
//  Created by zhijian chen on 2017/4/7.
//  Copyright © 2017年 zhijian chen. All rights reserved.
//

import UIKit

public class SNBaseTableViewController: UITableViewController {
    
    

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(background)
        background.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalToSuperview()
        }
        tableView.separatorStyle = .none
        tableView.bounces = false

    }
    
    
    lazy var background : SNNodataView = {
        let obj = SNNodataView.view()
        obj.isHidden = true
        return obj
    }()

}

class SNNodataView : UIView{
    class func view()->SNNodataView{
        let view = SNNodataView()
        view.setUp()
        view.setUI()
        return view
    
    }
    
    func setNewOffset(height : CGFloat){
        imgView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(height)
            make.centerX.equalToSuperview()
        }
        tip_Lab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imgView.snp.bottom).offset(fit(30))
        }
    }
    
    private func setUp(){
        backgroundColor = UIColor.white
    }
    private func setUI(){
        addSubview(imgView)
        addSubview(tip_Lab)
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(fit(230))
            make.centerX.equalToSuperview()
        }
        tip_Lab.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imgView.snp.bottom).offset(fit(30))
        }
    }
    private lazy var imgView : UIImageView = {
        let obj = UIImageView(image: UIImage(named: "blank"))
        return obj
    }()
    
    private lazy var tip_Lab : UILabel = {
        let obj = UILabel()
        obj.text = "暂无数据 休息一下"
        obj.textColor = UIColor(hexadecimal: 0x878787)
        obj.font = UIFont.systemFont(ofSize: fit(30))
        return obj
    }()
}
