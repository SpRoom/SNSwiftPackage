//
//  WechatShareUtility.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/26.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation


// 微信 多媒体 对象生成
extension WechatManager {

    func getRequestMessage(_ image: UIImage?, title: String, desc: String) -> WXMediaMessage {

        let message = WXMediaMessage()

        // description    NSString    描述内容    限制长度不超过1KB
        let to = desc.prefix(128)
        message.description = String(to)

        //        thumbData    NSData    缩略图的二进制数据    限制内容大小不超过32KB
        if let image = image {
            let newImage = self.resizeImage(image, newWidth: 100)
            message.setThumbImage(newImage)
        } else {

        }

        //      title    NSString    消息标题    限制长度不超过512Bytes
        let titleRe = title.prefix(64)
        message.title = String(titleRe)

        return message

    }

}

extension WechatManager {

    /// 重置图片大小data
    ///
    /// - Parameters:
    ///   - image: 图片
    ///   - maxBytes: 目标大小 bytes 单位
    /// - Returns: 重置的图片data
    func resizeImageData(image: UIImage, maxBytes: Int) -> Data? {
        //        let maxBytes = 10485760
        let dataBytes = image.bytesSize

        if dataBytes < maxBytes {
            return image.jpegData(compressionQuality: 1)
        } else {

            let scale =  Float(dataBytes) / Float(maxBytes)
            return image.jpegData(compressionQuality: scale.cgFloat)

        }

    }

    /// 重置图片大小
    ///
    /// - Parameters:
    ///   - image: 图片
    ///   - newWidth: 目标宽度
    /// - Returns: 重置后的图片
    func resizeImage(_ image: UIImage, newWidth: CGFloat) -> UIImage {

        let newHeight = image.size.height / image.size.width * newWidth
        UIGraphicsBeginImageContext( CGSize(width: newWidth, height: newHeight) )
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
