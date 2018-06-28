//
//  ZPHBaseTableView.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/17.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

public class SNBaseTableView: UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        SNLog("table create with style")
        
        defautlConfig()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 空数据图
    fileprivate var noDataView = SNBaseNoDataView()

    fileprivate var noDataViewImageName = "" {
        didSet {
            noDataView.imgV.image = Image(noDataViewImageName)
        }
    }
    
    fileprivate var noDataViewDesc = "" {
        didSet {
            noDataView.descL.text = noDataViewDesc
        }
    }
    
    fileprivate var showNoDataView = false {
        didSet {
            if showNoDataView {
                self.bringSubview(toFront: noDataView)
                noDataView.isHidden = false
            } else {
                self.insertSubview(noDataView, at: 0)
                noDataView.isHidden = true
            }
        }
    }
}


extension SNBaseTableView {
    
    func defautlConfig() {
        separatorStyle = .none
        estimatedRowHeight = 100
        //        bounces = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        backgroundColor = color_bg_gray
        //        emptyDataSetSource = self
        //        emptyDataSetDelegate = self
        
        
        addSubview(noDataView)
        
        noDataView.snp.makeConstraints { (make) in
            make.left.snEqualToSuperview()
            if let h = tableHeaderView {
            make.top.snEqualTo(h.snp.bottom)
            } else {
            make.top.snEqualToSuperview()
            }
            make.width.snEqualToSuperview()
            make.height.snEqualToSuperview()
        }
        
        showNoDataView = false
    }
    
    
   public func noData(show: Bool,desc: String="暂时没有数据", blankImageName: String="nothing") {
        
        self.noDataViewImageName = blankImageName
        self.noDataViewDesc = desc
        self.showNoDataView = show
        
        self.noDataView.snp.remakeConstraints { (make) in
            make.left.snEqualToSuperview()
            if let h = tableHeaderView {
                make.top.snEqualTo(h.snp.bottom)
            } else {
                make.top.snEqualToSuperview()
            }
            make.width.snEqualToSuperview()
            make.height.snEqualToSuperview()
        }
    }
}


