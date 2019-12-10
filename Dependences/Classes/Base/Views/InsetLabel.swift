//
//  InsetLabel.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/4.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation

class InsetLabel: View {
    
    fileprivate let label = Label()
    
    var font: UIFont {
        set {
            label.font = newValue
        }
        get {
            return label.font
        }
    }
    
    var text: String? {
        set {
            label.text = newValue
        }
        get {
            return label.text
        }
    }
    
    var textColor: UIColor {
        set {
            label.textColor = newValue
        }
        get {
            return label.textColor
        }
    }

    override func setupView() {
        super.setupView()
        
        addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.position(left: 5, top: 8, right: -5, bottom: -8)
        }
    }
    
    
    func reSet(constraints left: CGFloat? = nil, top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil) {
        label.snp.remakeConstraints { (make) in
            make.position(left: left, top: top, right: right, bottom: bottom)
        }
    }
}


import RxSwift
import RxCocoa

extension Reactive where Base: InsetLabel {
    
    var textColor: Binder<UIColor> {
        return Binder(base) { view, attr in
            view.textColor = attr
        }
    }
    
    var text: Binder<String> {
        return Binder(base) { view, attr in
            view.text = attr
        }
    }
}
