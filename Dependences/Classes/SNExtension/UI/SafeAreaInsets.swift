//
//  SafeAreaInsets.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/5/8.
//  Copyright © 2019 zsh. All rights reserved.
//

import UIKit

extension UIViewController {

    private var safeInsets: UIEdgeInsets {

        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
        } else {
            return .zero
        }
    }

    public var realSafeAreaInsets: UIEdgeInsets {

        return safeInsets
    }

    public var realSafeTop: CGFloat {
        return safeInsets.top
    }

    public var realSafeLeft: CGFloat {
        return safeInsets.left
    }

    public var realSafeBottom: CGFloat {
        return safeInsets.bottom
    }

    public var realSafeRight: CGFloat {
        return safeInsets.right
    }

    public var realSafeMarginBottom: CGFloat {
        return safeInsets.bottom > 0 ? 15 : 0
    }

}


extension UIView {

    private var safeInsets: UIEdgeInsets {

        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
        } else {
            return .zero
        }
    }

    public var realSafeAreaInsets: UIEdgeInsets {

        return safeInsets
    }

    public var realSafeTop: CGFloat {
        return safeInsets.top
    }

    public var realSafeLeft: CGFloat {
        return safeInsets.left
    }

    public var realSafeBottom: CGFloat {
        return safeInsets.bottom
    }

    public var realSafeRight: CGFloat {
        return safeInsets.right
    }

    public var realSafeMarginBottom: CGFloat {
        return safeInsets.bottom > 0 ? 15 : 0
    }
}
