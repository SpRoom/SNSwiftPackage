//
//  SNBaseNoDataView.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/8/30.
//  Copyright © 2018年 spectator Mr.Z. All rights reserved.
//

import UIKit

protocol SNBaseNoDataRender {

    func setNoDataViewImage(name: String)
    
    func setNoDataViewDesc(str: String)
    
    func showNoDataView(action: Bool)
    
    var nodataView : SNBaseNoDataView {get}
}

extension SNBaseNoDataRender where Self : UIViewController {
    
    func setNoDataViewImage(name: String) {
        nodataView.imgV.image = Image(name)
    }
    
    
    func setNoDataViewDesc(str: String) {
        nodataView.descL.text = str
    }
    
    
    func showNoDataView(action: Bool) {
        
        if action {
            view.addSubview(nodataView)
        } else {
            nodataView.removeFromSuperview()
        }
        
    }
    
    
}
