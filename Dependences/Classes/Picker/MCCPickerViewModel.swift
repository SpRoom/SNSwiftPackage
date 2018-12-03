//
//  MCCPickerViewModel.swift
//  changshoubao
//
//  Created by spectator Mr.Z on 2018/10/25.
//  Copyright © 2018 Mr.Z. All rights reserved.
//

import Foundation

class MCCPickerViewModel : SNBaseViewModel {
    
    typealias addresArr = ([SNMCCPickerModel])->()
    var queryResult : addresArr?
}


extension MCCPickerViewModel {
    /*
    func getChildren(code: String) {
        APIRequest(requestType: APIExp.mccList(code: code), modelType: [mccListApiModel.self]).subscribe(onNext: { (result) in
            switch result {
            case .success(let models):
                self.parse(models: models)
            case .fail(code: let code, msg: let msg):
                self.netFailDeailWith(code: code, msg: msg, callBack: nil)
            default:
                break
            }
        }, onError: { (e) in
            self.netErrorDealwith(e: e)
        }).disposed(by: disposeBag)
    }
    
    
    func parse(models: [mccListApiModel]) {
        
        let adds =  models.compactMap { (api)  in
            SNMCCPickerModel.init(name: api.typeName, code: api.id, mcc: api.bizId)
        }
        
        defer {
            queryResult?(adds)
        }
    }
 */
}
