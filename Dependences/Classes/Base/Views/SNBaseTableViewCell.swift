//
//  ZPHBaseTableViewCell.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/17.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import RxSwift

open class SNBaseTableViewCell: UITableViewCell {

    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        basicStyle()
        initCustom()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public var disposeBag = DisposeBag()
    
    override open func prepareForReuse() {
        disposeBag = DisposeBag()
    }


}


@objc extension SNBaseTableViewCell {
    open func setupView() {    }
    
    func basicStyle() {
        selectionStyle = .none
    }
    
    open func initCustom() {
        
    }
}
