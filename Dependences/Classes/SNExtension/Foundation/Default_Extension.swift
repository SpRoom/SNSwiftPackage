//
//  Default_Extension.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/6/28.
//  Copyright © 2018年 spectator Mr.Z. All rights reserved.
//

import Foundation


public var SNDefault_userTokenDefaultKey = "userToken"
public var SNDefault_usernameDefaultKey = "username"

// MARK: - 保存token 到 userDefault
func saveTokenToUserDefault(token: String) {
    UserDefaults.standard.set(token, forKey: SNDefault_userTokenDefaultKey)
}

// MARK: - 清除 userDefault 中的 token
func cleanTokenOnUserDefault() {
    UserDefaults.standard.set("", forKey: SNDefault_userTokenDefaultKey)
}

// MARK: - 获取 userDefault 中的 token
func fetchTokenByUserdefault() -> String {
    let value = UserDefaults.standard.string(forKey: SNDefault_userTokenDefaultKey)
    
    return value ?? ""
}

// MARK: - 保存username 到 userDefault
func saveUsernameToUserDefault(username: String) {
    UserDefaults.standard.set(username, forKey: SNDefault_usernameDefaultKey)
}
// MARK: - 清除 userDefault 中的 username
func cleanUsernameOnUserDefault() {
    UserDefaults.standard.set("", forKey: SNDefault_usernameDefaultKey)
}

// MARK: - 获取 userDefault 中的 username
func fetchUsernameByUserdefault() -> String {
    let value = UserDefaults.standard.string(forKey: SNDefault_usernameDefaultKey)
    
    return value ?? ""
}
