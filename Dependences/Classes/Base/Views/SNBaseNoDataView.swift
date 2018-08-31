//
//  SNNoDataView.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/8/31.
//  Copyright © 2018年 spectator Mr.Z. All rights reserved.
//

import UIKit

class SNBaseNoDataView : SNBaseView {
    
    let imgV = UIImageView().then {
        $0.image = Image("nothing")
        $0.contentMode = .scaleAspectFit
    }
    let descL = UILabel().then {
        $0.textColor = Color(0x8f8f8f)
        $0.text = "暂无数据 休息一下"
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
            make.width.height.snEqualTo(300)
            make.centerX.snEqualToSuperview()
        }
        
        descL.snp.makeConstraints { (make) in
            make.top.snEqualTo(imgV.snp.bottom).snOffset(40)
            make.centerX.snEqualToSuperview()
        }
        
    }
}
