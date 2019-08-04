//
//  UITextField+Extension.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/3/18.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation

extension UITextField {

    public func setPlaceholder(text: String, font: UIFont, color: UIColor) {

        let attributes = [
            NSAttributedString.Key.foregroundColor: color,
            NSAttributedString.Key.font : font // Note the !
        ]
        attributedPlaceholder = NSAttributedString(string: text, attributes:attributes)
    }
}
