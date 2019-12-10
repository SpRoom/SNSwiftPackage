//
//  CellViewModel.swift
//  ytxIos
//
//  Created by x j z l on 2019/9/4.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import RxCocoa

class CellViewModel: NSObject {
    let title = BehaviorRelay<String>(value: "")
}
