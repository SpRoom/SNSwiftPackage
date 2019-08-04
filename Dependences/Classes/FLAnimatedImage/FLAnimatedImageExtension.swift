//
//  FLAnimatedImageExtension.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/4.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import FLAnimatedImage

extension Array where Element: FLAnimatedImageView {
    
    public var gifName: String {
        set {
            for view in self {
                view.gifName = newValue
            }
        }
        get {
            return ""
        }
    }
}


extension FLAnimatedImageView {
    
    public var gifName: String {
        set {
            let url = Bundle.main.url(forResource: newValue, withExtension: "gif")!
            if let data = try? Data.init(contentsOf: url) {
                let animation = FLAnimatedImage(animatedGIFData: data)
                self.animatedImage = animation
            }
        }
        get {
            return ""
        }
    }
}
