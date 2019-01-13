//
//  SNViewController.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/12/3.
//  Copyright © 2018 spectator Mr.Z. All rights reserved.
//

import Foundation
import UIKit

public typealias SNBaseViewController = _SNBaseViewController

public protocol SNBaseViewControllerImpl {
    
    associatedtype ViewModelType: SNBaseViewModel

    var vmodel: ViewModelType { get set }
}



