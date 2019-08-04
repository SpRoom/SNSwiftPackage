//
//  UIImage_Extension.swift
//  diandianzanumsers
//
//  Created by 楠 on 2017/6/9.
//  Copyright © 2017年 specddz. All rights reserved.
//

import Foundation
import UIKit

// UI
/// 图片
public func Image(_ name: String) -> UIImage? {
    return UIImage(named: name)
}

extension UIImage {
    
    //创建纯颜色图片
    public static func create(by color : UIColor) -> UIImage{
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!
    }
    
}


public extension UIImage {
    
    ///对指定图片进行拉伸
    func resizableImage(name: String) -> UIImage {
        
        var normal = UIImage(named: name)!
        let imageWidth = normal.size.width * 0.5
        let imageHeight = normal.size.height * 0.5
        normal = resizableImage(withCapInsets: UIEdgeInsets(top: imageHeight, left: imageWidth, bottom: imageHeight, right: imageWidth))
        
        return normal
    }
    
    /**
     *  压缩上传图片到指定字节
     *
     *  image     压缩的图片
     *  maxLength 压缩后最大字节大小
     *
     *  return 压缩后图片的二进制
     */
    func compressImage(maxLength: Int) -> Data? {
        
        let newSize = self.scaleImage(imageLength: 300)
        let newImage = self.resizeImage(newSize: newSize)
        
        var compress:CGFloat = 0.9
        var data = newImage.jpegData(compressionQuality: compress)
        
        while (data?.count)! > maxLength && compress > 0.01 {
            compress -= 0.02
            data = newImage.jpegData(compressionQuality: compress)
        }
        
        return data
    }
    
    /**
     *  通过指定图片最长边，获得等比例的图片size
     *
     *  image       原始图片
     *  imageLength 图片允许的最长宽度（高度）
     *
     *  return 获得等比例的size
     */
    func  scaleImage(imageLength: CGFloat) -> CGSize {
        
        var newWidth:CGFloat = 0.0
        var newHeight:CGFloat = 0.0
        let width = self.size.width
        let height = self.size.height
        
        if (width > imageLength || height > imageLength){
            
            if (width > height) {
                
                newWidth = imageLength;
                newHeight = newWidth * height / width;
                
            }else if(height > width){
                
                newHeight = imageLength;
                newWidth = newHeight * width / height;
                
            }else{
                
                newWidth = imageLength;
                newHeight = imageLength;
            }
            
        }
        return CGSize(width: newWidth, height: newHeight)
    }
    
    /**
     *  获得指定size的图片
     *
     *  image   原始图片
     *  newSize 指定的size
     *
     *  return 调整后的图片
     */
    func resizeImage(newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}
