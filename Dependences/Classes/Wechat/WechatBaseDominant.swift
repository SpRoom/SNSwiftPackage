//
//  WechatBaseDominant.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation


// 微信请求资料相关 生成请求参数
enum WechatBaseDominant {

    static let baseUrlString = "https://api.weixin.qq.com/sns"

    case accessToken(String) // 获取 access_token
    case userInfo // 获取用户信息
    case refreshToken
    case checkToken

    var path: String {
        switch self {
        case .accessToken:
            return "/oauth2/access_token"
        case .userInfo:
            return "/userinfo"
        case .refreshToken:
            return "/oauth2/refresh_token"
        case .checkToken:
            return "/auth"
        }
    }


    var parameters: [String: String] {
        switch self {
        case .accessToken(let code):
            return [
                "appid": WechatManager.shared.appId,
                "secret": WechatManager.shared.appSecret,
                "code": code,
                "grant_type": "authorization_code"
            ]
        case .userInfo:
            return [
                "openid": WechatManager.shared.openId,
                "access_token": WechatManager.shared.accessToken
            ]
        case .refreshToken:
            return [
                "appid": WechatManager.shared.appId,
                "refresh_token": WechatManager.shared.refreshToken,
                "grant_type": "refresh_token"
            ]
        case .checkToken:
            return [
                "openid": WechatManager.shared.openId,
                "access_token": WechatManager.shared.accessToken
            ]
        }
    }

    var request: URLRequest {

        var url = URL(string: WechatBaseDominant.baseUrlString)!
        url.appendPathComponent(path)

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.cachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData

        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {

            let encodeQuery = (urlComponents.percentEncodedQuery.map({ $0 + "&" }) ?? "") + query(parameters)
            urlComponents.percentEncodedQuery = encodeQuery
            urlRequest.url = urlComponents.url
        }

        return urlRequest


    }

    private func query(_ parameters: [String: Any]) -> String {
        var components: [(String, String)] = []

        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]!
            components += queryComponents(fromKey: key, value: value)
        }

        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }

    /// Creates percent-escaped, URL encoded query string components
    /// from the given key-value pair using recursion.
    ///
    /// - parameter key:   The key of the query component.
    /// - parameter value: The value of the query component.
    ///
    /// - returns: The percent-escaped, URL encoded query string components.
    private func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
        var components: [(String, String)] = []

        if let dictionary = value as? [String: Any] {
            for (nestedKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
            }
        } else if let array = value as? [Any] {
            for value in array {
                components += queryComponents(fromKey: "\(key)[]", value: value)
            }
        } else if let bool = value as? Bool {
            components.append((escape(key), escape((bool ? "1" : "0"))))
        } else {
            components.append((escape(key), escape("\(value)")))
        }

        return components
    }

    /// Returns a percent-escaped string following RFC 3986 for a query string key or value.
    ///
    /// RFC 3986 states that the following characters are "reserved" characters.
    ///
    /// - General Delimiters: ":", "#", "[", "]", "@", "?", "/"
    /// - Sub-Delimiters: "!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="
    ///
    /// In RFC 3986 - Section 3.4, it states that
    /// the "?" and "/" characters should not be escaped to allow
    /// query strings to include a URL. Therefore,
    /// all "reserved" characters with the exception of "?" and "/"
    /// should be percent-escaped in the query string.
    ///
    /// - parameter string: The string to be percent-escaped.
    ///
    /// - returns: The percent-escaped string.
    private func escape(_ string: String) -> String {
        // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowedCharacterSet = CharacterSet.urlQueryAllowed
        let characters = "\(generalDelimitersToEncode)\(subDelimitersToEncode)"
        allowedCharacterSet.remove(charactersIn: characters)

        return string.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) ?? string
    }
}
