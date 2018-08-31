//
//  ZPHBaseTableView.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/17.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit

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
    var nodataView = SNBaseNoDataView()

}


extension SNBaseTableView {
    
    func defautlConfig() {
        
        separatorStyle = .none
        estimatedRowHeight = 100
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        backgroundColor = SNBaseView.defaultBgColor

    }
    

}

extension SNBaseTableView : SNBaseNoDataRender {}


