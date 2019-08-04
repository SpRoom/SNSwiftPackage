//
//  SNNumerTextField.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/5/8.
//  Copyright © 2019 zsh. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

/*
extension Reactive where Base: SNNumberTextField {

    var maxNum: Binder<Double> {
        return Binder(self.base) { view, max in
            view.rx.controlEvent(.editingDidEnd).subscribe(onNext: { () in
                let max = max
                let current = view.text?.double() ?? 0
                if current > max {
                    view.text = max.string
                }
            })
        }
    }
}
*/

/// 数字输入框
class SNNumberTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)

        delegate = self
        keyboardType = .decimalPad
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var decimalNum = 2
    var pointNum = 1

}

extension SNNumberTextField: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = text else { return false }
//        let dots = text.filter { $0 == "." }

        if string == "" { return true }

        if (string != "." && string.int == nil)  { return false }

        let spetrs = text.components(separatedBy: ".")
        if (spetrs.count - 1) >= pointNum && string == "." {
            return false
        } else if (spetrs.count - 1) >= pointNum && spetrs[pointNum].count >= decimalNum && pointNum > 0 {
            return false
        } else {
            return true
        }

//        return dots.count == 0 || string != "."
    }
}
