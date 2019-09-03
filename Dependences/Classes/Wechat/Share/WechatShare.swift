//
//  WechatShare.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/1/25.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation
import UIKit
import SNSwiftPackage

//  微信分享相关
extension WechatManager {

    /// 微信分享类型
    ///
    /// - text: 文字类型分享
    /// - image: 图片类型分享
    /// - music: 音乐类型分享
    /// - vedio: 视频类型分享
    /// - webpage: 网页类型分享
    /// - miniProgram: 小程序类型分享
    public enum WechatShareType {
        /// 文字类型分享
        ///
        /// - Parameters:
        ///   - title: 分享的内容
        ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
        case text(String)
        /// 图片类型分享
        ///
        /// - Parameters:
        ///   - image: 图片 内容大小不超过10MB
        ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
        case image(UIImage)
        /// 音乐类型分享
        ///
        /// - Parameters:
        ///   - title: 限制长度不超过512Bytes
        ///   - desc: 描述内容 限制长度不超过1KB
        ///   - thumbImage: 缩略图的二进制数据 限制内容大小不超过32KB
        ///   - musicUrl: 音频网页的URL地址  限制长度不超过10KB
        ///   - musicLowBandUrl: 供低带宽环境下使用的音频网页URL地址  限制长度不超过10KB
        ///   - musicDataUrl: 音频数据的URL地址  限制长度不超过10KB
        ///   - musicLowBandDataUrl: 供低带宽环境下使用的音频数据URL地址  限制长度不超过10KB
        ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
        case music(title: String, desc: String, thumbImage: UIImage, musicUrl: String, musicLowBandUrl: String, musicDataUrl: String, musicLowBandDataUrl: String)
        /// 视频类型分享
        ///
        /// - Parameters:
        ///   - title: 限制长度不超过512Bytes
        ///   - desc: 描述内容 限制长度不超过1KB
        ///   - thumbImage: 缩略图的二进制数据 限制内容大小不超过32KB
        ///   - videoUrl: 视频链接  限制长度不超过10KB
        ///   - videoLowBandUrl: 供低带宽的环境下使用的视频链接  限制长度不超过10KB
        ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
        case vedio(title: String, desc: String, thumbImage: UIImage, videoUrl: String, videoLowBandUrl: String)
        /// 网页类型分享
        ///
        /// - Parameters:
        ///   - title: 限制长度不超过512Bytes
        ///   - desc: 描述内容 限制长度不超过1KB
        ///   - thumbImage: 缩略图的二进制数据 限制内容大小不超过32KB
        ///   - webUrl: html链接  限制长度不超过10KB
        ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
        case webpage(title: String, desc: String, thumbImage: UIImage, webUrl: String)
        /*
         注意：

         发起分享的App与小程序属于同一微信开放平台帐号。
         支持分享小程序类型消息至会话，暂不支持分享至朋友圈。
         若客户端版本低于6.5.6或在iPad客户端接收，小程序类型分享将自动转成网页类型分享。开发者必须填写网页链接字段，确保低版本客户端能正常打开网页链接。
         */
        /// 小程序类型分享
        ///
        /// - Parameters:
        ///   - title: 消息标题 限制长度不超过512Bytes
        ///   - desc: 描述内容 限制长度不超过1KB
        ///   - thumbImage: 缩略图的二进制数据 限制内容大小不超过32KB
        ///   - webpageUrl: 兼容低版本的网页链接  限制长度不超过10KB
        ///   - userName: 小程序的userName  小程序原始ID获取方法：登录小程序管理后台-设置-基本设置-帐号信息
        ///   - path: 小程序的页面路径
        ///   - hdImageData: 小程序新版本的预览图二进制数据，6.5.9及以上版本微信客户端支持   限制大小不超过128KB，自定义图片建议长宽比是 5:4。
        ///   - withShareTicket: 是否使用带shareTicket的分享  通常开发者希望分享出去的小程序被二次打开时可以获取到更多信息，例如群的标识。可以设置withShareTicket为true，当分享卡片在群聊中被其他用户打开时，可以获取到shareTicket，用于获取更多分享信息。详见小程序获取更多分享信息 ，最低客户端版本要求：6.5.13
        ///   - miniprogramType: 小程序的类型，默认正式版，1.8.1及以上版本开发者工具包支持分享开发版和体验版小程序  正式版: WXMiniProgramTypeRelease; 测试版: WXMiniProgramTypeTest; 体验版: WXMiniProgramTypePreview;
        case miniProgram(title: String, desc: String, thumbImage: UIImage, webpageUrl: String, userName: String, path: String, hdImageData: UIImage, withShareTicket: Bool, miniprogramType: WXMiniProgramType)
    }


    /// 微信分享
    ///
    /// - Parameters:
    ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;  小程序目前只支持会话
    ///   - type: <#type description#>
    public func share(scene: WXScene, type: WechatShareType) {

        switch type {
        case .text(let title):
            self.shareText(title: title, scene: scene)
        case .image(let thumbImage):
            self.shareImage(image: thumbImage, scene: scene)
        case let .music(title, desc, thumbImage, musicUrl, musicLowBandUrl, musicDataUrl, musicLowBandDataUrl):
            self.shareMusic(title: title, desc: desc, thumbImage: thumbImage, musicUrl: musicUrl, musicLowBandUrl: musicLowBandUrl, musicDataUrl: musicDataUrl, musicLowBandDataUrl: musicLowBandDataUrl, scene: scene)
        case let .vedio(title, desc, thumbImage, videoUrl, videoLowBandUrl):
            self.shareVideo(title: title, desc: desc, thumbImage: thumbImage, videoUrl: videoUrl, videoLowBandUrl: videoLowBandUrl, scene: scene)
        case let .webpage(title, desc, thumbImage, webUrl):
            self.shareWebpage(title: title, desc: desc, thumbImage: thumbImage, webUrl: webUrl, scene: scene)
        case let .miniProgram(title, desc, thumbImage, webpageUrl, userName, path, hdImageData, withShareTicket, miniprogramType):
            self.shareMiniProgram(title: title, desc: desc, thumbImage: thumbImage, webpageUrl: webpageUrl, userName: userName, path: path, hdImageData: hdImageData, withShareTicket: withShareTicket, miniprogramType: miniprogramType)
        }

    }




}


extension WechatManager {

    /*
     注意：

     发起分享的App与小程序属于同一微信开放平台帐号。
     支持分享小程序类型消息至会话，暂不支持分享至朋友圈。
     若客户端版本低于6.5.6或在iPad客户端接收，小程序类型分享将自动转成网页类型分享。开发者必须填写网页链接字段，确保低版本客户端能正常打开网页链接。
     */
    /// 小程序类型分享
    ///
    /// - Parameters:
    ///   - title: 消息标题 限制长度不超过512Bytes
    ///   - desc: 描述内容 限制长度不超过1KB
    ///   - thumbImage: 缩略图的二进制数据 限制内容大小不超过32KB
    ///   - webpageUrl: 兼容低版本的网页链接  限制长度不超过10KB
    ///   - userName: 小程序的userName  小程序原始ID获取方法：登录小程序管理后台-设置-基本设置-帐号信息
    ///   - path: 小程序的页面路径
    ///   - hdImageData: 小程序新版本的预览图二进制数据，6.5.9及以上版本微信客户端支持   限制大小不超过128KB，自定义图片建议长宽比是 5:4。
    ///   - withShareTicket: 是否使用带shareTicket的分享  通常开发者希望分享出去的小程序被二次打开时可以获取到更多信息，例如群的标识。可以设置withShareTicket为true，当分享卡片在群聊中被其他用户打开时，可以获取到shareTicket，用于获取更多分享信息。详见小程序获取更多分享信息 ，最低客户端版本要求：6.5.13
    ///   - miniprogramType: 小程序的类型，默认正式版，1.8.1及以上版本开发者工具包支持分享开发版和体验版小程序  正式版: WXMiniProgramTypeRelease; 测试版: WXMiniProgramTypeTest; 体验版: WXMiniProgramTypePreview;
    func shareMiniProgram(title: String, desc: String, thumbImage: UIImage, webpageUrl: String, userName: String, path: String, hdImageData: UIImage, withShareTicket: Bool, miniprogramType: WXMiniProgramType) {

        let urlSizeLimit = FileSize(unit: .KB, num: 10).bytesValue.int
        let imageDataSizeLimit = FileSize(unit: .KB, num: 128).bytesValue.int

        guard webpageUrl.bytesSize <= urlSizeLimit else {

            SNLog("微信分享兼容低版本的网页链接太长")
            return
        }

        let miniProgramObject = WXMiniProgramObject()
        miniProgramObject.webpageUrl = webpageUrl
        miniProgramObject.userName = userName
        miniProgramObject.path = path
        miniProgramObject.hdImageData = resizeImageData(image: hdImageData, maxBytes: imageDataSizeLimit)
        miniProgramObject.withShareTicket = withShareTicket
        miniProgramObject.miniProgramType = miniprogramType


        let message = getRequestMessage(thumbImage, title: title, desc: desc)
        message.mediaObject = miniProgramObject

        //目前只支持会话
        sendWX(message: message, scene: WXSceneSession)

    }


    /// 网页类型分享
    ///
    /// - Parameters:
    ///   - title: 限制长度不超过512Bytes
    ///   - desc: 描述内容 限制长度不超过1KB
    ///   - thumbImage: 缩略图的二进制数据 限制内容大小不超过32KB
    ///   - webUrl: html链接  限制长度不超过10KB
    ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
    func shareWebpage(title: String, desc: String, thumbImage: UIImage, webUrl: String, scene: WXScene) {

        let urlSizeLimit = FileSize(unit: .KB, num: 10).bytesValue.int

        guard webUrl.bytesSize <= urlSizeLimit else {

            SNLog("微信分享网页链接太长")
            return
        }

        let webpageObject = WXWebpageObject()
        webpageObject.webpageUrl = webUrl

        let message = getRequestMessage(thumbImage, title: title, desc: desc)
        message.mediaObject = webpageObject

        sendWX(message: message, scene: scene)

    }


    /// 视频类型分享
    ///
    /// - Parameters:
    ///   - title: 限制长度不超过512Bytes
    ///   - desc: 描述内容 限制长度不超过1KB
    ///   - thumbImage: 缩略图的二进制数据 限制内容大小不超过32KB
    ///   - videoUrl: 视频链接  限制长度不超过10KB
    ///   - videoLowBandUrl: 供低带宽的环境下使用的视频链接  限制长度不超过10KB
    ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
    func shareVideo(title: String, desc: String, thumbImage: UIImage, videoUrl: String, videoLowBandUrl: String, scene: WXScene) {

        let urlSizeLimit = FileSize(unit: .KB, num: 10).bytesValue.int

        guard videoUrl.bytesSize <= urlSizeLimit else {

            SNLog("微信分享视频链接太长")
            return
        }

        guard videoLowBandUrl.bytesSize <= urlSizeLimit else {
            SNLog("微信分享供低带宽的环境下使用的视频链接太长")
            return
        }

        let videoObject = WXVideoObject()
        videoObject.videoLowBandUrl = videoLowBandUrl
        videoObject.videoUrl = videoUrl

        let message = getRequestMessage(thumbImage, title: title, desc: desc)
        message.mediaObject = videoObject

        sendWX(message: message, scene: scene)
    }


    /// 音乐类型分享
    ///
    /// - Parameters:
    ///   - title: 限制长度不超过512Bytes
    ///   - desc: 描述内容 限制长度不超过1KB
    ///   - thumbImage: 缩略图的二进制数据 限制内容大小不超过32KB
    ///   - musicUrl: 音频网页的URL地址  限制长度不超过10KB
    ///   - musicLowBandUrl: 供低带宽环境下使用的音频网页URL地址  限制长度不超过10KB
    ///   - musicDataUrl: 音频数据的URL地址  限制长度不超过10KB
    ///   - musicLowBandDataUrl: 供低带宽环境下使用的音频数据URL地址  限制长度不超过10KB
    ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
    func shareMusic(title: String, desc: String, thumbImage: UIImage, musicUrl: String, musicLowBandUrl: String, musicDataUrl: String, musicLowBandDataUrl: String, scene: WXScene) {

        let urlSizeLimit = FileSize(unit: .KB, num: 10).bytesValue.int

        //        let musicObject = title.bytes
        guard musicUrl.bytesSize <= urlSizeLimit else {

            SNLog("微信分享音频网页的URL地址太长")
            return
        }

        guard musicLowBandUrl.bytesSize <= urlSizeLimit else {
            SNLog("微信分享供低带宽环境下使用的音频网页URL地址太长")
            return
        }

        guard musicDataUrl.bytesSize <= urlSizeLimit else {
            SNLog("微信分享音频数据的URL地址太长")
            return
        }

        guard musicLowBandDataUrl.bytesSize <= urlSizeLimit else {
            SNLog("微信分享供低带宽环境下使用的音频数据URL地址太长")
            return
        }

        let musicObject = WXMusicObject()
        musicObject.musicUrl = musicUrl
        musicObject.musicLowBandDataUrl = musicLowBandDataUrl
        musicObject.musicDataUrl = musicDataUrl
        musicObject.musicLowBandDataUrl = musicLowBandDataUrl


        let message = getRequestMessage(thumbImage, title: title, desc: desc)
        message.mediaObject = musicObject

        sendWX(message: message, scene: scene)
    }

    /// 图片类型分享
    ///
    /// - Parameters:
    ///   - image: 图片 内容大小不超过10MB
    ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
    func shareImage(image: UIImage?, scene: WXScene) {

        guard let image = image else {
            return
        }

        let imageObject = WXImageObject()
        let imageSizeLimit = FileSize(unit: .MB, num: 10).bytesValue.int
        if let imageData = resizeImageData(image: image, maxBytes: imageSizeLimit) {
        imageObject.imageData = imageData
        } else {
            imageObject.imageData = image.jpegData(compressionQuality: 1)!
        }


        let message = WXMediaMessage()
        message.thumbData = resizeImage(image, newWidth: 100).jpegData(compressionQuality: 1)
        message.mediaObject = imageObject

        sendWX(message: message, scene: scene)

    }

    func sendWX(message: WXMediaMessage, scene: WXScene) {
        let req = SendMessageToWXReq()
        req.bText = false
        req.message = message
        req.scene = Int32(scene.rawValue)

        WXApi.send(req)
    }


    /// 文字类型分享
    ///
    /// - Parameters:
    ///   - title: 分享的内容
    ///   - scene: 发送的目标场景 分享到对话: WXSceneSession; 分享到朋友圈: WXSceneTimeline; 分享到收藏: WXSceneFavorite;
    func shareText(title: String, scene: WXScene) {
        let req = SendMessageToWXReq()
        req.bText = true
        req.text = title
        req.scene = Int32(scene.rawValue)
        WXApi.send(req)
    }

}
