//
//  StringApiModel.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/4/20.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import SwiftyJSON
//#if canImport(SNSwiftPackage)
//import SNSwiftPackage
//#endif

extension String: SNSwiftyJSONAble {

    public init?(jsonData: JSON) {
        self = jsonData.stringValue
    }
}
