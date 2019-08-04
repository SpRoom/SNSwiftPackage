//
//  BoolApiModel.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/4/24.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Bool: SNSwiftyJSONAble {

    public init?(jsonData: JSON) {
        self = jsonData.boolValue
    }
}
