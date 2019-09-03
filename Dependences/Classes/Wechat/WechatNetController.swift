//
//  WechatNetController.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation

// 微信请求控制器
class WechatNetController {

    private static let session = URLSession.shared

    class func request(dominant: WechatBaseDominant, completion: @escaping (([String: Any]) -> Void)) {

        let task = session.dataTask(with: dominant.request) { (data, resp, error) in
            guard error == nil else { return }

            guard resp is HTTPURLResponse else {
                // 400
                return
            }

            guard let validData = data, !validData.isEmpty else {
                // 204
                return
            }

            let jsonObject = try? JSONSerialization.jsonObject(with: validData, options: .allowFragments)

            guard let json = jsonObject as? [String: Any] else {
                // 解析失败
                return
            }

            completion(json)
        }

        task.resume()
    }
}
