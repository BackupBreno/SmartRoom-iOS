//
//  BlurButton.swift
//  BlurView
//
//  Created by Breno Aquino on 14/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit

class BlurButton: UIButton {

    var blurBackgroundView: UIView!
    
    var blurEffect: BlurEffect!
    
    var animationDuration: Double!
    
    var alphaColorON: Double!
    
    var alphaColorOFF: Double!
    
    var alphaBlur: Double!
    
    var colorON: UIColor!
    
    var colorOFF: UIColor!
    
    var isON: Bool!
    
    var isCircle: Bool = true
    
    var isToResize: Bool = true
    
    var scale: Double = 2.0/3.0
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        
        self.blurBackgroundView = UIView(frame: self.frame)

        self.imageView?.addSubview(self.blurBackgroundView)
        
        self.imageView?.sendSubview(toBack: self.blurBackgroundView)
        
        self.blurEffect = BlurEffect(style: .regular, color: .white)
        
        self.animationDuration = 0.5
        
        self.alphaColorON = 0.85
        
        self.alphaColorOFF = 0.3
        
        self.alphaBlur = 0.1
        
        self.colorON = UIColor.white.withAlphaComponent(CGFloat(self.self.alphaColorON))
        
        self.colorOFF = UIColor.white.withAlphaComponent(CGFloat(self.alphaColorOFF))
        
        self.isON = false
        
        self.setView(color: self.colorOFF, alpha: self.alphaColorOFF)
        
        self.layer.cornerRadius = self.frame.width / 2
        
        if let image = self.currentImage {
            
            self.setImage(image.resizeImage(self.frame.width * CGFloat(self.scale), opaque: false), for: .normal)
        }
    }
    
    func reloadImage() {
        
        if let image = self.currentImage {
            
            if self.isToResize {
                
                self.setImage(image.resizeImage(2 * self.frame.width / 3, opaque: false), for: .normal)
                
            } else {
                
                self.setImage(image, for: .normal)
            }
        }
    }
    
    // MARK: - Refresh
    
    
    
    // MARK: - Set States
    
    func setState(isON: Bool) {
        
        self.isON = isON
        
        if self.isON {
            
            self.setView(color: self.colorON, alpha: self.alphaColorON)
            
        } else {
            
            self.setView(color: self.colorOFF, alpha: self.alphaColorOFF)
        }
    }
    
    // MARK: - Actions
    
    fileprivate func setView(color: UIColor, alpha: Double) {
        
        self.blurEffect.showWithAnimation(duration: self.animationDuration, alphaBlur: self.alphaBlur, alphaColor: alpha, viewToPresent: self.blurBackgroundView, animation: {
            
            self.backgroundColor = color
        })
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        self.isON = !self.isON
        
        if self.isON {
            
            self.setView(color: self.colorON, alpha: self.alphaColorON)
            
        } else {
            
            self.setView(color: self.colorOFF, alpha: self.alphaColorOFF)
        }
    }
}
