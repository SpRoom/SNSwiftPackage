//
//  Fit+Value.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/3.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import SNSwiftPackage

extension Int {
    public var fit: CGFloat {
        return SNSwiftPackage.fit(self)
    }
}

extension CGFloat {
    public var fit: CGFloat {
        return SNSwiftPackage.fit(self)
    }
}
