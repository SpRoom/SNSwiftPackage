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



class SNSwiftPackageManager  {
    
    public static func config(annotion type: UIAnnotationType, disign width: CGFloat) {
        
        designWidth = width
        annotationType = type
    }

}


let IS_IPONE = UIDevice.current.model == "iPhone"




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

//MARK: - 获取版本号
func getCurrentIOS() -> CGFloat
{
    return CGFloat(Float(UIDevice.current.systemVersion)!)
}

// APP相关信息
let infoDictionary = Bundle.main.infoDictionary
/// app name 应用名称
public let appName = infoDictionary!["CFBundleDisplayName"] as! String //程序名称
/// app version 应用版本
public let majorVersion = infoDictionary!["CFBundleShortVersionString"] as! String //主程序版本号
/// app build version  应用编译版本
public let buildVersion = infoDictionary!["CFBundleVersion"] as! String//版本号（内部标示）

// 设备相关信息

/// iOS version  手机系统版本
public let iosVersion = UIDevice.current.systemVersion //ios版本
/// iPhone name  手机名称
public let systemName = UIDevice.current.systemName //设备名称
/// iPhone identifier  手机设备标识
public let identifierNumber = UIDevice.current.identifierForVendor //设备udid
/// iPhone Model  手机型号
public let deviceModel = UIDevice.current.model //设备型号
/// iPhone area model  手机区域化型号
public let localizedModel = UIDevice.current.localizedModel //设备区域化型号如A1533
