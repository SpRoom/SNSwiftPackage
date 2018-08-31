//
//  SNRadioButtonRender.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/8/31.
//  Copyright © 2018年 spectator Mr.Z. All rights reserved.
//

import UIKit

protocol SNRadioButtonRender {
    
    /// radio tag
    var groupId: String {set get}
    
    /// current check status, and private
    var check: Bool {set get}
    
    /// check status, config variable
    var checked: Bool {set get}
    
    /// radios collections
    static var checkedGroupDic: [String:[Self]] {set get}
    
    /// init by group tag id
    ///
    /// - Parameter id: tag
    init(groupId id: String)
    
    /// add self to radios collections
    func addToGroup()
    
    /// remove self in radios collections
    func removeFromGroup()
    
    /// click events dealwith
    func radioChecked()
    
    /// set self status in check
    func setChecked()
    
    /// clear more status
    func unCheckedOthers()
    
    
    /// clear style
    func unCheckRefresh()
    
    
    /// click event
    func click()
}

extension SNRadioButtonRender where Self : UIButton {
    
    func addToGroup() {
        guard var sRadios = Self.checkedGroupDic[groupId] else {
            var sradios = [Self]()
            sradios.append(self)
            Self.checkedGroupDic[groupId] = sradios
            return
        }
        
        sRadios.append(self)
        Self.checkedGroupDic[groupId] = sRadios
    }
    
    func removeFromGroup() {
        
        guard var sRadios = Self.checkedGroupDic[groupId] else {
            return
        }
        
        sRadios.remove(object: self)
        
        if sRadios.count == 0 {
            Self.checkedGroupDic.removeValue(forKey: groupId)
        }
    }
    
    mutating func radioChecked() {
        
        if checked {
            click()
            return
        }
        
        //        sort = true
        isSelected = !isSelected
        checked = isSelected
        refreshState()
        
        if isSelected {
            unCheckedOthers()
        }
        
        click()
       
    }
    
    func setChecked() {
        
        isSelected = checked
        refreshState()
        
        if isSelected {
            unCheckedOthers()
        }
        
    }
    
    mutating func unCheckedOthers() {
        
        guard let raios = Self.checkedGroupDic[groupId] else {
            return
        }
        
        if raios.count > 0 {
            
            for var button in raios {
                if button != self {
                    button.checked = false
                    unCheckRefresh()
                }
            }
        }
    }
    
    func refreshState() {}
    
    
}
