//
//  Default_Extension.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/6/28.
//  Copyright © 2018年 spectator Mr.Z. All rights reserved.
//

import Foundation


// MARK: - 保存token 到 userDefault
func saveTokenToUserDefault(token: String) {
    UserDefaults.standard.set(token, forKey: userTokenDefaultKey)
}

// MARK: - 清除 userDefault 中的 token
func cleanTokenOnUserDefault() {
    UserDefaults.standard.set("", forKey: userTokenDefaultKey)
}

// MARK: - 获取 userDefault 中的 token
func fetchTokenByUserdefault() -> String {
    let value = UserDefaults.standard.string(forKey: userTokenDefaultKey)
    
    return value ?? ""
}

// MARK: - 保存username 到 userDefault
func saveUsernameToUserDefault(username: String) {
    UserDefaults.standard.set(username, forKey: usernameDefaultKey)
}
// MARK: - 清除 userDefault 中的 username
func cleanUsernameOnUserDefault() {
    UserDefaults.standard.set("", forKey: usernameDefaultKey)
}

// MARK: - 获取 userDefault 中的 username
func fetchUsernameByUserdefault() -> String {
    let value = UserDefaults.standard.string(forKey: usernameDefaultKey)
    
    return value ?? ""
}
