//
//  RxTextField+Utility.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/5/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension UITextField {

    func limit(money max: Double) -> Disposable {

        return self.rx.controlEvent(.editingDidEnd).subscribe(onNext: { () in
            guard let text = self.text else { return }
            let current = text.double() ?? 0
            if current > max {
                self.text = max.moneyStr
            }
        })
    }

    func limit(count: Int) -> Disposable {

        return self.rx.controlEvent(.editingChanged).subscribe(onNext: { () in
            guard let text = self.text else { return }

            self.text = String(text.prefix(count))
        })
    }
}
