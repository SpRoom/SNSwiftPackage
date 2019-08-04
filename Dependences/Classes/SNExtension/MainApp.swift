//
//  MainApp.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import UIKit

struct MainApp {
    
    public static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    public static var appBundleID: String {
        return Bundle.main.bundleIdentifier ?? ""
    }
    
    public static var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
}
