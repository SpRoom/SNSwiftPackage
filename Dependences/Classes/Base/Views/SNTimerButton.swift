//
//  SNTimerButton.swift
//  zhipinhui
//
//  Created by 朱楚楠 on 2017/10/24.
//  Copyright © 2017年 Spectator. All rights reserved.
//

import UIKit
import RxSwift


/// 每次点击按钮需调用start方法
public class SNTimerButton: UIButton {

    // 倒计时时间
    let time : Int
    // 默认显示内容
    var content : String {
        didSet {
            setTitle(content, for: .normal)
        }
    }
    
    
    /// 设置倒计时时间和内容
    ///
    /// - Parameters:
    ///   - remainTime: 倒计时时长  秒
    ///   - title: 默认显示内容
    public init(remainTime: Int, title: String = "验证码") {
        time = remainTime
        content = title
        
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 剩余时间
    var remainSecond = 0 {
        willSet {
            setTitle("\(newValue)秒", for: .normal)
            if newValue <= 0 {
                isCounting = false
                isEnabled = true
                setTitle(content, for: .normal)
                
            }
        }
    }
    
    // 倒计时timer
    var countdownTimer : Timer?
    /// 是否倒计时中
    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
                
                remainSecond = time
                
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
                
            }
            
        }
    }
    
    /// 倒计时内容更新
    ///
    /// - Parameter timer: 倒计时timer
    @objc func updateTime(timer: Timer) {
        // 计时开始时，逐秒减少remainingSeconds的值
        remainSecond -= 1
    }
    
    /// 开始倒计时
    public func start() {
        
        isEnabled = false
        isCounting = true
    }
    
    /// 设置默认内容
    ///
    /// - Parameter title: 默认显示
    public func setContent(title: String) {
        content = title
    }

}
