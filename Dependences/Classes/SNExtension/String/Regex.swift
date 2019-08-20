//
//  Regex.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/4.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation

struct Regex {
    
    static let chinese = #"[\u4e00-\u9fa5]"#
    static let chinaPhone = #"[1][^6,1,2,0][0-9]{9,9}"#
}

public extension String {
    
    func isChinaPhone() -> Bool {
        return match(pattern: Regex.chinaPhone)
    }
    
    func isChinese() -> Bool {
        return match(pattern: Regex.chinese)
    }
    
}

extension String {
    func match(pattern: String) -> Bool {
        
        let result = self.range(of: pattern, options: .regularExpression)
        return result != nil
    }
}
