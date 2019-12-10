//
//  LogManager.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/22.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import SNSwiftPackage
import RxSwift

public func logResourcesCount() {
    #if DEBUG
    SNLog("RxSwift resources count: \(RxSwift.Resources.total)")
    #endif
}
