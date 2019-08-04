//
//  UICollectionView_Extension.swift
//  SNSwiftpackageSyntax
//
//  Created by Spec on 2019/8/5.
//  Copyright © 2019 Spec. All rights reserved.
//

import UIKit


extension UICollectionViewCell: ReusableView {}


extension UICollectionView {
    
    /// cell 复用
    ///
    /// - Parameter indexPath: cell indexPath
    /// - Returns: cell
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T /* where T: ReusableView */ {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    
    /// 注册table view cell
    ///
    /// - Parameter cell: 需要注册的cell
    public func register<T: UICollectionViewCell>(_ cell: T.Type) {
        
        register(cell.self, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }
    
    
    /// 批量注册cell
    ///
    /// - Parameter cells: 需要注册的cell数组
    public func registers<T: UICollectionViewCell>(_ cells: [T.Type]) {
        
        for cell in cells {
            register(cell.self)
        }
    }
}
