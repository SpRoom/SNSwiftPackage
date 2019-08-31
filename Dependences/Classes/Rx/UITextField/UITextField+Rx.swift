//
//  UITextField+Rx.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/2.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UITextField {

    var borderColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            view.borderColor = attr
        }
    }

    var placeholderColor: Binder<UIColor?> {
        return Binder(self.base) { view, attr in
            if let color = attr {
                view.setPlaceHolderTextColor(color)
            }
        }
    }
}

public protocol CompareData: Equatable {

}


extension Double: CompareData {}

 extension UITextField {

    func bind<T: CompareData>(relay: BehaviorRelay<String>, min: T, max: T) -> Disposable {
        _ = self.rx.textInput <-> relay

        return self.rx.controlEvent(.editingDidEnd).subscribe(onNext: { () in
                
        })
    }

    public func bind(relay: BehaviorRelay<String>, limit: Int? = nil) -> Disposable {

        _ = self.rx.textInput <-> relay

        return self.rx.controlEvent(.editingChanged).subscribe(onNext: { () in

            if let count = limit {

                let str = self.text!

                let lang = self.textInputMode?.primaryLanguage

                if  lang == "zh-Hans" {

                    if let selectedRange = self.markedTextRange {

                        let position = self.position(from: selectedRange.start, offset: 0)

                        if position == nil {
                            if str.count > count {
                                self.text = String(str.prefix(count))
                            }

                        } else {
                            //                        if str.count > count {
                            //                            self.tagField.text = String(str.prefix(count))
                            //                        }
                        }
                    } else if str.count > count {
                        self.text = String(str.prefix(count))
                    }
                } else {
                    if str.count > count {
                        self.text = String(str.prefix(count))
                    }
                }
            }

        })
/*
        return self.rx.controlEvent(.editingChanged).subscribe(onNext: { [unowned self] in
            if let text = self.text {
                if let count = limit {
                let finalText = String(text.prefix(count))
                relay <= finalText
                }
            }
        })
        */
    }
}
