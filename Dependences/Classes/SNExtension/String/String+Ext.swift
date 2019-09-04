//
//  String+Ext.swift
//  Alamofire
//
//  Created by x j z l on 2019/9/3.
//

import Foundation

extension String {

    public func components(with charaset: String, second: String) -> [String: String] {

        var dic: [String: String] = [:]

        let firstArr = self.components(separatedBy: charaset)

        for dicStr in firstArr {

            let finalArr = dicStr.components(separatedBy: second)
            if finalArr.count == 2 {
                dic[finalArr[0]] = finalArr[1]
            }

        }

        return dic

    }

}
