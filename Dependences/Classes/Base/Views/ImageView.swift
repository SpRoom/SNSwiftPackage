//
//  ImageView.swift
//  ytxIos
//
//  Created by x j z l on 2019/8/23.
//  Copyright © 2019 spectator. All rights reserved.
//

import UIKit

class ImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        setupViews()
    }
    
    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        
        layer.masksToBounds = true
        contentMode = .scaleAspectFill //center
        
//        hero.modifiers = [.arc]
        
        // Kingfisher
         kf.indicatorType = .activity
        
        updateUI()
    }
    
    func updateUI() {
        setNeedsDisplay()
    }

}
