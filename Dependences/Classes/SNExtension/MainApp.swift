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
    
    public static var appDisplayName: String {
        return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }
    
    public static var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    @available(iOS 13, *)
    public static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
            .filter({$0.isKeyWindow}).first ?? nil
    }
}
