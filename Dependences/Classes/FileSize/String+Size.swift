//
//  String+Size.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/26.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation

extension String {

    var bytesSize: Int {
        return self.utf8.count
    }
}
