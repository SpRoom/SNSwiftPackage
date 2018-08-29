//
//  Random_Extentsion.swift
//  ShenZhouDaDiXing
//
//  Created by spectator Mr.Z on 2016/10/23.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import UIKit


let randomContentArr = ["0","1","2","3","4","5","6","7","8","9"]

class Random_Extentsion: NSObject {
    
    func UUIDByNumber() -> String {
        
        var uuid = ""
        
        for _ in 0..<32 {
            
            let subscri = Int(arc4random()%10)
            let str = randomContentArr[subscri]
            uuid = uuid + str
        }
        
        UserDefaults.standard.set(uuid, forKey: "uuid")
        UserDefaults.standard.synchronize()
        return uuid
    }
    
    func getDateString(start: Int, end: Int) -> String {
        
        let date = Date()
        var dateValue = date.timeIntervalSince1970
        dateValue = dateValue * 1000
        let dateStr = String(format: "%.0f", dateValue)

        
//        let starBound = dateStr.index(dateStr.startIndex, offsetBy: start)
//        let endBound = dateStr.index(dateStr.startIndex, offsetBy: end)
        
//        let resultStr = dateStr.substring(with: Range(uncheckedBounds: (starBound, endBound)))
        let resultStr = dateStr.substring(star: start, end: end)
        
        return resultStr
    }
    
    func getBillNumber() -> String {
        
        var uuid = ""
        if let onlyID = UserDefaults.standard.value(forKey: "uuid") {
            uuid = onlyID as! String
        } else {
        
         uuid = UUIDByNumber()
        }
        SNLog("random \(uuid)")
        let uuidIndex = uuid.index(uuid.startIndex, offsetBy: 3)
//        let first = uuid.substring(to: uuidIndex)
        let first = uuid.prefix(upTo: uuidIndex)
        
        
        let timeStamp = getDateString(start: 2, end: 9)
        
        let uuids = first + "\(arc4random()%10)" + timeStamp + "\(arc4random()%10)"
        
        return uuids
    }
    
    func getCartBatchNumber() -> String {
        
        var uuid = ""
        if let onlyID = UserDefaults.standard.value(forKey: "uuid") {
            uuid = onlyID as! String
        } else {
            
            uuid = UUIDByNumber()
        }
        SNLog("random \(uuid)")
        let uuidIndex = uuid.index(uuid.startIndex, offsetBy: 5)
//        let first = uuid.substring(to: uuidIndex)
        let first = uuid.prefix(upTo: uuidIndex)
        
        let timeStamp = getDateString(start: 8, end: 13)
        
        return "VR" + first + timeStamp + "\(arc4random()%10)" + "\(arc4random()%10)"
    }

}
