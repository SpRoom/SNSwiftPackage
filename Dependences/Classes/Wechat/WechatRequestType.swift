//
//  WechatRequestType.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation


// 微信请求类型 目前没用 已被替代
public enum WechatRequestType {
    case userInfo //获取用户个人信息

    var scope: String {
        switch self {
        case .userInfo:
            return "snsapi_userinfo"
        }
    }
}
