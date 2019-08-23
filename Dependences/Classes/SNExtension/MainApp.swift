//
//  MainApp.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import UIKit

public struct MainApp {
    
    public static var statusBarHeight: CGFloat {
        if #available(iOS 13, *) {
//            return UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 20
            return 0
        } else {
        return UIApplication.shared.statusBarFrame.height
        }
    }
    
    public static var appBundleID: String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    public static var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
}
