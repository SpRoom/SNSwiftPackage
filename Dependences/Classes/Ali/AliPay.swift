//
//  AliPay.swift
//  zshSeedOne
//
//  Created by spectator Mr.Z on 2019/4/21.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import SNSwiftPackage
import SwiftyJSON

/*
extension AliPayManager {
    
    public static func turn(orderStr: String, handler: @escaping (Bool) -> Void) {
        
        AlipaySDK.defaultService()?.payOrder(orderStr, fromScheme: Configs.App.aliSchemes, callback: { (dic) in

            SNLog(dic)

            guard let dic = dic else { return }

            if let resultStatus = dic["resultStatus"] as? String, resultStatus == "9000" {

                if let result = dic["result"] as? String {

                    let json = JSON(parseJSON: result)

                    if let jsonDic = json["alipay_trade_app_pay_response"].dictionary {
                        if jsonDic["code"] == "10000" {
                            handler(true)
                        } else {
                            handler(false)
                        }
                    } else {
                        handler(false)
                    }
                } else {
                    handler(false)
                }

/*
                if let resultdd = dic["result"] as? [String: Any], let result = resultdd["alipay_trade_app_pay_response"] as? String {

                    let resultDic = result.components(with: "&", second: "=")

                    if resultDic["code"] == "10000" {
                        handler(true)
                    } else {
                        handler(false)
                    }
                }
*/
            } else {
                let memo = dic["memo"] as? String
                SZHUD(memo ?? "未知错误", type: .info, callBack: nil)
                handler(false)
            }
/*
                if let resultStatus = dic["resultStatus"] as? String, resultStatus == "6001" {
                let memo = dic["memo"] as? String
                SZHUD(memo ?? "未知错误", type: .info, callBack: nil)
            } else if let resultStatus = dic["resultStatus"] as? String, resultStatus == "6002" {
                let memo = dic["memo"] as? String
                SZHUD(memo ?? "未知错误", type: .info, callBack: nil)
            } else {
                let memo = dic["memo"] as? String
                SZHUD(memo ?? "未知错误", type: .info, callBack: nil)
                SNLog("error")
            }
            */
        })
    }
}
*/
