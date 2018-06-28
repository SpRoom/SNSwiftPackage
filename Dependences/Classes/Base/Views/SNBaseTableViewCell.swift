//
//  ZPHBaseTableViewCell.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/17.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import RxSwift

public class SNBaseTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        basicStyle()
        initCustom()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var disposeBag = DisposeBag()
    
    override public func prepareForReuse() {
        disposeBag = DisposeBag()
    }


}


@objc public extension SNBaseTableViewCell {
    func setupView() {    }
    
    func basicStyle() {
        selectionStyle = .none
    }
    
    func initCustom() {
        
    }
}
