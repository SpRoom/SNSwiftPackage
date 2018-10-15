//
//  Common.swift
//  ChouNiMei-Client
//
//  Created by Spectator on 16/7/15.
//  Copyright © 2016年 ZZC WORKSPACE. All rights reserved.
//

import Foundation
import UIKit
class common: NSObject {
    
}
//MARK: - 公共属性

public let ScreenW = UIScreen.main.bounds.width

public let ScreenH = UIScreen.main.bounds.height

public func fit(_ attribute: CGFloat) -> CGFloat {
    return adjustSizeWithUiDesign(attribute: attribute, UiDesignWidth: 750.0)
}


let IS_IPONE = UIDevice.current.model == "iPhone"
//用于屏幕设配 等比例方法缩小
fileprivate func adjustSize(attribute: CGFloat) -> CGFloat {
    
    
//    precondition(IS_IPONE, "this is not iphone,adjust method can not be used")
    
    var result : CGFloat = 0.0
    switch ScreenW {
    case 414:
        result = attribute
    case 375:
        result = attribute/1.104
        
    case 768:
        result = attribute * 1.85507
    default:
        result = attribute/1.29375
    }
    return result
}


//此方法基本不用,通过APPCommon中的adjustSizeAPP调用此方法
func adjustSizeWithUiDesign(attribute: CGFloat,UiDesignWidth: CGFloat) -> CGFloat {
    let rate = UiDesignWidth/414.0
    
    return adjustSize(attribute: attribute/rate)
}


public func SNLog<T>(_ message: T, file: String = #file, function: String = #function, line: Int = #line) {
    
    var fileName = file as NSString
    
    fileName = fileName.lastPathComponent as NSString
    print("[\(fileName)--\(function)--\(line) : \(message)]")
}

//func ZJLog<T>(messagr : T ,file : String = #file,function : String = #function, line : Int = #line  )
//{
//    #if DEBUG
//        let str1 = (file as NSString).lastPathComponent
//        let str2 = NSMutableString.init(string: str1)
//        let range = NSRange.init(location: 0, length: str2.length)
//        str2.replaceOccurrences(of: ".swift", with: "", options: NSString.CompareOptions.backwards, range: range)
//        print("<\(str2)--\(function)>[\(line)]:\(messagr)")
//    #endif
//}

func ColorRGB(red: CGFloat, green: CGFloat , blue: CGFloat ) -> UIColor {
    
    return ColorRGBA(red: red, green: green, blue: blue, alpha: 1.0)
}

func ColorRGBA(red: CGFloat, green: CGFloat , blue: CGFloat ,alpha: CGFloat) -> UIColor {
    let color = UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    
    return color
}

func cellIdentify(cellClass : AnyClass) -> String {
    return NSStringFromClass(cellClass)
    
}

//MARK: - 获取版本号
func getCurrentIOS() -> CGFloat
{
    return CGFloat(Float(UIDevice.current.systemVersion)!)
}

// APP相关信息
let infoDictionary = Bundle.main.infoDictionary
public let appName = infoDictionary!["CFBundleDisplayName"] as! String //程序名称
public let majorVersion = infoDictionary!["CFBundleShortVersionString"] as! String //主程序版本号
public let buildVersion = infoDictionary!["CFBundleVersion"] as! String//版本号（内部标示）
// 设备相关信息
public let iosVersion = UIDevice.current.systemVersion //ios版本
public let systemName = UIDevice.current.systemName //设备名称
public let identifierNumber = UIDevice.current.identifierForVendor //设备udid
public let deviceModel = UIDevice.current.model //设备型号
public let localizedModel = UIDevice.current.localizedModel //设备区域化型号如A1533
