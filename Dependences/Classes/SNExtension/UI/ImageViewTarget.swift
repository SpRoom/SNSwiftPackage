//
//  ImageViewTarget.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/4.
//  Copyright © 2019 Spec. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    public func set(image: ImageTarget, placeholder: ImageTarget? = nil) {
        
        if let headStr = image as? String,
            headStr.isEmpty {
            self.image = nil
            if let place = getImage(any: placeholder) {
                
                self.image = place
            }
            return
        }
        
        if let headStr = image as? String,
            let img = Image(headStr) {
            self.image = img
            return
        }
        
        
        //        if let headStr = image as? String,
        //            let headurl = headStr.url {
        //            kf.setImage(with: headurl)
        //            return
        //        }
        
        if  let headStr = image as? String {
            let urlStr = headStr.urlDecoded
            if urlStr.hasPrefix("https://") || urlStr.hasPrefix("http://") {
                if let place = placeholder as? UIImage {
                    kf.setImage(with: URL(string: urlStr), placeholder: place)
                } else {
                    kf.setImage(with: URL(string: urlStr))
                }
                
                return
            }
        }
        
        if let headImg = image as? UIImage {
            self.image = headImg
            return
        }
        
        if let place = getImage(any: placeholder) {
            
            self.image = place
        }
        
        
    }
    
    /// 获取本地图片
    ///
    /// - Parameter any: 图片 或者 文字
    /// - Returns: 图片
    func getImage(any: ImageTarget?) -> UIImage? {
        
        return UIImage.fetch(from: any)
    }
}

extension UIImage {
    
    static func fetch(from any: ImageTarget?) -> UIImage? {
        
        if let image = any as? UIImage {
            return image
        }
        if let str = any as? String {
            return UIImage(named: str)
        }
        
        return nil
        
    }
}

public protocol ImageTarget {
    
}
extension URL: ImageTarget {}
extension String: ImageTarget {}
extension UIImage: ImageTarget {}
