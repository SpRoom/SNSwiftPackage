//
//  SNViewController.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/12/3.
//  Copyright © 2018 spectator Mr.Z. All rights reserved.
//

import Foundation
import UIKit

public typealias SNBaseViewController = SNBaseViewControllerImpl & _SNBaseViewController

public protocol SNBaseViewControllerImpl {
    
    associatedtype vm: SNBaseViewModel
    
    var vmodel: vm {get set}
    
    func bbind()
}

extension SNBaseViewControllerImpl where Self : _SNBaseViewController {
    
    public func bbind() {
        
        vmodel.jumpSubject.subscribe(onNext: { (vc,type) in
            VCJump(VC: self, to: vc, type: type)
        }).disposed(by: disposeBag)
        
    }
    

}


