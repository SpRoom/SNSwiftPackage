//
//  SwiftyStoreKitTool.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/4.
//  Copyright © 2019 Spec. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyStoreKit
import StoreKit

public struct StoreTool {
    
    static let shared = StoreTool()
    
    let disposeBag = DisposeBag()
    
    let productId = ""
    let secretCode = "fdsakj#@dfksja23%$!31daf"
    
    
    /// 获取商品信息
    ///
    /// - Parameter handler: （商品, 类型，1.成功获取商品，2.没有查到商品，3.异常）
    func getInfo(handler: @escaping ((SKProduct?, Int)->())) {
        
        SwiftyStoreKit.retrieveProductsInfo([productId]) { (result) in
            if let product = result.retrievedProducts.first {
                let identifier = product.productIdentifier
                let price = product.localizedPrice
                let title = product.localizedTitle
                SNLog("available purchases: \(identifier), title: \(title), price: \(price!)")
                handler(product,1)
            } else if let invalidProductId = result.invalidProductIDs.first {
                SNLog("could not retrieve product info, Invalid product identifier: \(invalidProductId)")
                handler(nil, 2)
            } else {
                handler(nil, 3)
                SNLog("error: \(String(describing: result.error))")
            }
        }
    }
    
    func purchase(_ productID: String, handler: @escaping (PurchaseResult)->()) {
        SwiftyStoreKit.purchaseProduct(productID, atomically: true) { result in
            handler(result)
        }
    }
    
}
