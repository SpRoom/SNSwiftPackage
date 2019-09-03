//
//  WechatPay.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/2/15.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation


extension WechatManager {

    /// 调起支付
    ///
    /// - Parameters:
    ///   - partnerId: 商户号
    ///   - prepayId: 预支付交易会话ID
    ///   - package: 扩展字段
    ///   - nonceStr: 随机字符串
    ///   - timeStamp: 时间戳
    ///   - sign: 签名
    public func turn(payment partnerId: String, prepayId: String, package: String, nonceStr: String, timeStamp: UInt32, sign: String) {

        let request = PayReq()
        request.partnerId = partnerId
        request.prepayId = prepayId
        request.package = package
        request.nonceStr = nonceStr
        request.timeStamp = timeStamp
        request.sign = sign

        WXApi.send(request)
    }

}
