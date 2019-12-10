//
//  StackView.swift
//  ytxIos
//
//  Created by x j z l on 2019/10/22.
//  Copyright © 2019 spectator. All rights reserved.
//

import Foundation

class StackView: UIStackView {
     override init(frame: CGRect) {
         super.init(frame: frame)
         makeUI()
     }

     required init(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         makeUI()
     }

     func makeUI() {
//         spacing = inset
         axis = .vertical
         // self.distribution = .fill

         updateUI()
     }

     func updateUI() {
         setNeedsDisplay()
     }
}
