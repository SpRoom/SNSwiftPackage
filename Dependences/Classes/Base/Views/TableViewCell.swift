//
//  TableViewCell.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/4.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import SNSwiftPackage

class TableViewCell: SNBaseTableViewCell {
    
    let subContentView = View()
    
    var needReload: (() -> Void)?
}

extension TableViewCell {
    
    override func setupView() {
        super.setupView()
        
        contentView.addSubview(subContentView)
        selectionStyle = .none
        
        subContentView.snp.makeConstraints { (make) in
            make.position(left: 0, top: 0, right: 0, bottom: 0)
        }
    }
}
