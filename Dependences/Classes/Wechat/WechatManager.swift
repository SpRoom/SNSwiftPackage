//
//  WechatManager.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import SNSwiftPackage

// manager
public class WechatManager: NSObject {

    public static let shared = WechatManager()
    private override init() {}

    public var appId: String = ""
    public var appSecret: String = ""

    public static var csrf: String = "zsh@0098"

    public typealias CodeHandler = (String) -> Void
    public var codeHandler: CodeHandler?

    public typealias AccessTokenHandler = () -> ()
    public var accessTokenHandler: AccessTokenHandler?

    public typealias FailHandler = (Int32) -> Void
    public var failHandler: FailHandler?

    public typealias DicHandler = ([String: Any]) -> Void
    public var dicHandler: DicHandler?

    public typealias PayResultHandler = (Bool) -> Void
    public var payResultHandler: PayResultHandler?

    public lazy var wechatReq: SendAuthReq = {
        let req =  SendAuthReq()
        return req
    }()

    public func register(appId: String, appSecret: String) {
        WXApi.registerApp(appId)
        self.appId = appId
        self.appSecret = appSecret
    }


    public var openId: String = ""
    public var accessToken: String = ""
    public var refreshToken: String = ""
}
