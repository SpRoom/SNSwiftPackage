//
//  AliPayManager.swift
//  zshSeedOne
//
//  Created by spectator Mr.Z on 2019/4/21.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import WechatSwiftPod
public class AliPayManager: NSObject {
    
    public static let shared = AliPayManager()
    
    var appId: String = ""
    var appSecret: String = ""
    
    
    public func register(appId: String, appSecret: String) {
        WXApi.registerApp(appId)
        self.appId = appId
        self.appSecret = appSecret
    }
    
}
