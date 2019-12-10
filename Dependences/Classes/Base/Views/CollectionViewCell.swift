//
//  CollectionViewCell.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/6.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import RxSwift

class CollectionViewCell: UICollectionViewCell {
    
    public var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc
extension CollectionViewCell {
    
    open func setupView() {}
}
