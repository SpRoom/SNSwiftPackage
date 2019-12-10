//
//  SNViewModel.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/21.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation
import SNSwiftPackage
import RxSwift

typealias RouteHandler = ((_ result: Any?) -> Void)
class ViewModel: SNBaseViewModel {
    
    var page = 1
    let pageCount = 20
    
    let error = ErrorTracker()
    
    let loadingIndica = ActivityIndicator()
    let headerLoading = ActivityIndicator()
    let footerLoading = ActivityIndicator()
    
    let routerSubject = PublishSubject<(String, SNJumpType, [String: Any], RouteHandler?)>()
    
    let tableNoMore = PublishSubject<Bool>()
    
    deinit {
        
        SNLog("\(type(of: self)): Deinited")
    }
}

extension ViewModel {
    func router(uri: String, jumpType: SNJumpType = .push, handler: RouteHandler? = nil) {
        
        SNLog(uri)
        guard !uri.isEmpty else { return }
        self.routerSubject <= (uri, jumpType, [:], handler)
    }
    
    /// action sheet alert
    /// - Parameter actions: actions array
    func actionSheet(actions: [UIAlertAction]) {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        sheet.addActions(actions, textColor: UIColor.black)

        self.jumpSubject <= (sheet, .present)
    }
}


