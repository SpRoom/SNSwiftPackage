//
//  WechatUtility.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation

// 对外方法
extension WechatManager {

    public func handler(url: URL) -> Bool {
        return WXApi.handleOpen(url, delegate: self)
    }

    /// 检查微信是否安装
    /// check wechat is installed
    ///
    /// - Returns: true: 已安装/installed; false: 未安装/uninstalled
    public func isInstalled() -> Bool {
        return WXApi.isWXAppInstalled()
    }
}


// 发送请求
extension WechatManager {

    public func send(req type: WechatRequestType) {

        if !isInstalled() {
            // 没有安装微信 不做响应
            print("暂未发现安装微信, file - \(#file), line - \(#line)")

            return
        }

        let req = SendAuthReq()
        req.scope = type.scope
        req.state = WechatManager.csrf

        WXApi.send(req)


    }
}
