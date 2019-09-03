//
//  WechatLogin.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/3.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import SNSwiftPackage


// 微信登录相关
extension WechatManager {

    func sendAuth() {

        let userinfo = WechatRequestType.userInfo

        let req = SendAuthReq()
        req.scope = userinfo.scope
        req.state = WechatManager.csrf

        if !isInstalled() {
            WXApi.sendAuthReq(req, viewController: self.topViewController()!, delegate: self)
        } else {
            WXApi.send(req)
        }
    }

    private func topViewController(base: UIViewController? = nil) -> UIViewController? {
        if base == nil {
            return topViewController(base: UIApplication.shared.keyWindow?.rootViewController)
        }
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }

    func getAccessToken(code: String) {

        WechatNetController.request(dominant: .accessToken(code)) { (result) in
            SNLog(result)

            if let err = result["errcode"] as? Int32 {
                SNLog(err)

                return
            }

            self.parseOpenId(info: result)
        }
    }

    func parseOpenId(info: [String: Any]) {
        SNLog(info)
        self.openId = info["openid"] as? String ?? ""
        self.accessToken = info["access_token"] as? String ?? ""
        self.refreshToken = info["refresh_token"] as? String ?? ""

        self.accessTokenHandler?()
    }

    func getuserInfo(_ completionHandler: @escaping DicHandler) {

        self.dicHandler = completionHandler

        WechatNetController.request(dominant: WechatBaseDominant.userInfo) { (result) in

            if let err = result["errcode"] as? Int32 {
                self.failHandler?(err)
                return
            }
            self.dicHandler?(result)
        }

    }
}








