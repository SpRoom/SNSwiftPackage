//
//  WechatDelegate.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import SNSwiftPackage


// 微信代理方法实现
extension WechatManager: WXApiDelegate {

    /*! @brief 收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
     *
     * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
     * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。
     * @param req 具体请求内容，是自动释放的
     */
    public func onReq(_ req: BaseReq) {

    }

    /*! @brief 发送一个sendReq后，收到微信的回应
     *
     * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
     * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等。
     * @param resp具体的回应内容，是自动释放的
     */
    public func onResp(_ resp: BaseResp) {

        if let temp = resp as? SendAuthResp {
            SNLog(temp)
            if 0 == temp.errCode && WechatManager.csrf.urlEncoded == temp.state {
                // success
                SNLog("wechat request success")

                codeHandler?(temp.code ?? "")

            } else {
                // failed
                failHandler?(WXErrCodeCommon.rawValue)
            }
        }

        if let temp = resp as? PayResp {
            switch temp.errCode {
            case WXSuccess.rawValue:
                // 支付成功处理
                SNLog("wechat pay success")
                payResultHandler?(true)
                break
            default:
                payResultHandler?(false)
                SNLog("wechat pay failed, err code - \(temp.errCode)")
                break
            }
        }
    }

    func isGetAccessToken(_ code: String)  {

        getAccessToken(code: code)

    }

}
