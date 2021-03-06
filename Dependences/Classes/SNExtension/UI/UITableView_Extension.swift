//
//  UIKitExtensions.swift
//  RxDataSources
//
//  Created by Segii Shulga on 4/26/16.
//  Copyright © 2016 kzaher. All rights reserved.
//

import class UIKit.UITableViewCell
import class UIKit.UITableView
import class UIKit.UIViewController
import struct Foundation.IndexPath


public protocol ReusableView {
    static var reuseIdentifier: String {get}
}

extension ReusableView {
    static public var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {
}

extension UIViewController : ReusableView {
}


// MARK: - tableview extension
extension UITableView {
    
    /// cell 复用
    ///
    /// - Parameter indexPath: cell indexPath
    /// - Returns: cell
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T /* where T: ReusableView */ {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    
    /// 注册table view cell
    ///
    /// - Parameter cell: 需要注册的cell
    public func register<T: UITableViewCell>(_ cell: T.Type) {
        
        register(cell.self, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    
    /// 批量注册cell
    ///
    /// - Parameter cells: 需要注册的cell数组
    public func registers<T: UITableViewCell>(_ cells: [T.Type]) {
        
        for cell in cells {
            register(cell.self)
        }
    }
}

extension UITableView {
    
    public func dequeueReusable<T: UITableViewCell>(class cell: T.Type) -> T {
        guard let aCell = dequeueReusableCell(withIdentifier: cell.reuseIdentifier) as? T else {
            fatalError("Couldn't find UITableViewCell for \(cell.reuseIdentifier), make sure the cell is registered with table view")
        }
        return aCell
    }
    
    public func registerCell<T: UITableViewCell>(nib cell: T.Type) {
        register(UINib(nibName: cell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: cell.reuseIdentifier)
    }
}
