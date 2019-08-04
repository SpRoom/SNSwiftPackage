//
//  UIButton+Attributed.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/8.
//  Copyright © 2019 zsh. All rights reserved.
//

import UIKit

public extension UIButton {

    /// #SNSwiftPackage reference SwifterSwift: Attributed Title of normal state for button; also inspectable from Storyboard.
      var attributedTitleForNormal: NSAttributedString? {
        get {
            return attributedTitle(for: .normal)
        }
        set {
            setAttributedTitle(newValue, for: .normal)
        }
    }

    /// #SNSwiftPackage reference SwifterSwift: Attributed Title of selected state for button; also inspectable from Storyboard.
      var attributedTitleForSelected: NSAttributedString? {
        get {
            return attributedTitle(for: .selected)
        }
        set {
            setAttributedTitle(newValue, for: .selected)
        }
    }

    /// #SNSwiftPackage reference SwifterSwift: Attributed Title of highlighted state for button; also inspectable from Storyboard.
      var attributedTitleForHighlighted: NSAttributedString? {
        get {
            return attributedTitle(for: .highlighted)
        }
        set {
            setAttributedTitle(newValue, for: .highlighted)
        }
    }

    /// #SNSwiftPackage reference SwifterSwift: Attributed Title of disabled state for button; also inspectable from Storyboard.
      var attributedTitleForDisabled: NSAttributedString? {
        get {
            return attributedTitle(for: .disabled)
        }
        set {
            setAttributedTitle(newValue, for: .disabled)
        }
    }
}
