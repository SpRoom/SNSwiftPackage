//
//  IntApiModel.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/5/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Int: SNSwiftyJSONAble {

    public init?(jsonData: JSON) {
        self = jsonData.intValue
    }
}
