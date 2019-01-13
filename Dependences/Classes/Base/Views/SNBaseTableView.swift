//
//  ZPHBaseTableView.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/17.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit

open class SNBaseTableView: UITableView {

    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        defautlConfig()
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


extension SNBaseTableView {
    
    func defautlConfig() {
        
        separatorStyle = .none
        estimatedRowHeight = 100
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        backgroundColor = SNBaseView.defaultBgColor

    }

    @objc open func setupViews() {
        
    }
    

}



