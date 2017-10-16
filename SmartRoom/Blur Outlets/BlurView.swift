//
//  BlurView.swift
//  SmartRoom
//
//  Created by Breno Aquino on 16/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit

class BlurView: UIView {

    var blurEffect: BlurEffect!
    
    var animationDuration: Double!
    
    var alphaColor: Double!
    
    var alphaBlur: Double!
    
    var color: UIColor!
    
    override func awakeFromNib() {
        
        self.blurEffect = BlurEffect(style: .regular, color: .white)
        
        self.animationDuration = 0.5
        
        self.alphaColor = 0.85
        
        self.alphaBlur = 0.1
        
//        self.color = UIColor.white.withAlphaComponent(self.alphaColor)
        
        self.blurEffect.showWithAnimation(duration: self.animationDuration, alphaBlur: self.alphaBlur, alphaColor: self.alphaColor, viewToPresent: self)
    }

}
