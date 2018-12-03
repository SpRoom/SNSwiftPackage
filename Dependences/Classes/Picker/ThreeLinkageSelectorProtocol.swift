//
//  ThreeLinkageSelectorProtocol.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/10/26.
//  Copyright © 2018 spectator Mr.Z. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa


protocol ThreeLinkageSelectorProtocol {
    
    associatedtype linkageOne : SNBaseTableView
    associatedtype linkageTwo : SNBaseTableView
    associatedtype linkageThree : SNBaseTableView
    
    associatedtype title1 : UILabel
    associatedtype title2 : UILabel
    associatedtype title3 : UILabel
    
    associatedtype flagV : UIView
    
    associatedtype titleV : UIView
    associatedtype listV : UIView
    
    var idx: Int { get set}
    
    var linkageOneRep: BehaviorRelay<TableSectionModel<SNMCCPickerModel>> { get set}
    var linkageTwoRep: BehaviorRelay<TableSectionModel<SNMCCPickerModel>> { get set}
    var linkageThreeRep: BehaviorRelay<TableSectionModel<SNMCCPickerModel>> { get set}
    
    var linkageOneArr : [SNMCCPickerModel] {get set}
    var linkageTwoArr : [SNMCCPickerModel] {get set}
    var linkageThreeArr : [SNMCCPickerModel] {get set}
    
    typealias intCall = (Int,SNMCCPickerModel)->()
    var click : intCall? {get set}
    
    typealias addrCall = (String)->()
    var result: addrCall? {get set}
}
