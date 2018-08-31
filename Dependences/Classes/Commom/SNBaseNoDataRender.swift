//
//  SNBaseNoDataView.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/8/30.
//  Copyright © 2018年 spectator Mr.Z. All rights reserved.
//

import UIKit

protocol SNBaseNoDataRender {
    
    /// set no data image view
    ///
    /// - Parameter name: image name
    func setNoDataViewImage(name: String)
    
    /// set no data desc
    ///
    /// - Parameter str: desc
    func setNoDataViewDesc(str: String)
    
    
    /// set no data show
    ///
    /// - Parameter action: show action variable
    func showNoDataView(action: Bool)
    
    /// set no data show by parameters
    ///
    /// - Parameters:
    ///   - img: image name
    ///   - str: nodata desc
    ///   - isShow: show
    func showNoDataView(img: String, str: String, isShow: Bool)
    
    /// no data view object
    var nodataView : SNBaseNoDataView {get}
}


extension SNBaseNoDataRender {
    
    func setNoDataViewImage(name: String) {
        nodataView.imgV.image = Image(name)
    }
    
    
    func setNoDataViewDesc(str: String) {
        nodataView.descL.text = str
    }
 
    func showNoDataView(img: String, str: String, isShow: Bool) {
        setNoDataViewImage(name: img)
        setNoDataViewDesc(str: str)
        showNoDataView(action: isShow)
    }
}

extension SNBaseNoDataRender where Self : UIViewController {

    
    func showNoDataView(action: Bool) {
        
        if action {
            view.addSubview(nodataView)
            
            nodataView.snp.makeConstraints { (make) in
                make.edges.snEqualToSuperview()
            }
        } else {
            nodataView.removeFromSuperview()
            nodataView.snp.removeConstraints()
        }
        
    }

}

extension SNBaseNoDataRender where Self : UITableView {

    
    func showNoDataView(action: Bool) {
        
        if action {
            addSubview(nodataView)
            
            nodataView.snp.makeConstraints { (make) in
                make.edges.snEqualToSuperview()
            }

        } else {
            nodataView.removeFromSuperview()
            nodataView.snp.removeConstraints()
        }
        
    }
}
