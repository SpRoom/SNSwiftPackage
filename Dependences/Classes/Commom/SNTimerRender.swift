//
//  SNTimerRender.swift
//  SynaxTest
//
//  Created by spectator Mr.Z on 2018/8/31.
//  Copyright © 2018年 spectator Mr.Z. All rights reserved.
//

import UIKit

protocol SNTimerRender {
    
    // 倒计时时间
    var time : Int {set get}
    
    // 默认显示内容
    var content : String {set get}
    
    
    /// 剩余时间
    var remainSecond: Int {set get}
    
    
    /// 设置倒计时时间和内容
    ///
    /// - Parameters:
    ///   - remainTime: 倒计时时长  秒
    ///   - title: 默认显示内容
    func set(remainTime: Int, title: String)
    
    // 倒计时timer
    var countdownTimer: Timer? { get set }
   
    
    /// 是否倒计时中
    var isCounting : Bool {set get}
    
    
    /// 倒计时内容更新
    ///
    /// - Parameter timer: 倒计时timer
    func updateTime(timer: Timer)
    
    
    /// 开始倒计时
    func start()
    
    
    /// 设置默认内容
    ///
    /// - Parameter title: 默认显示
    func setContent(title: String)
    
    
}
