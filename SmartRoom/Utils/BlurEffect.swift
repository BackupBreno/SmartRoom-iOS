//
//  BlurEffect.swift
//  BlurView
//
//  Created by Breno Aquino on 13/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit

class BlurEffect {
    
    var blurView: UIVisualEffectView!
    
    var color: UIColor!
    
    var alphaColor: Double!
    
    var alphaBlur: Double!
    
    init(style: UIBlurEffectStyle, color: UIColor) {
        
        let blurEffect = UIBlurEffect(style: style)
        
        self.blurView = UIVisualEffectView(effect: blurEffect)
        
        self.blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.color = color
    }
    
    func show(alphaBlur: Double, alphaColor: Double, viewToPresent: UIView, sendToBack: Bool = true) {
        
        self.blurView.frame = viewToPresent.frame
        
        viewToPresent.addSubview(self.blurView)
        
        if sendToBack {
            
            viewToPresent.sendSubview(toBack: self.blurView)
        }
        
        self.blurView.alpha = CGFloat(alphaBlur)
        
        viewToPresent.backgroundColor = self.color.withAlphaComponent(CGFloat(alphaColor))
        
        self.alphaColor = alphaColor
        
        self.alphaBlur = alphaBlur
    }
    
    func setColor(viewToPresent: UIView, color: UIColor) {
        
        self.blurView.frame = viewToPresent.frame
        
        viewToPresent.addSubview(self.blurView)
        
        viewToPresent.sendSubview(toBack: self.blurView)
        
        self.blurView.alpha = CGFloat(alphaBlur)
        
        viewToPresent.backgroundColor = color.withAlphaComponent(CGFloat(alphaColor))
        
        self.color = color
    }
    
    func setAlphaColor(viewToPresent: UIView, alphaColor: Double) {
        
        self.show(alphaBlur: self.alphaBlur, alphaColor: alphaColor, viewToPresent: viewToPresent)
        
        self.alphaColor = alphaColor
    }
    
    func setAlphaBlur(viewToPresent: UIView, alphaBlur: Double) {
        
        self.show(alphaBlur: alphaBlur, alphaColor: self.alphaColor, viewToPresent: viewToPresent)
        
        self.alphaBlur = alphaBlur
    }
    
    func showWithAnimation(duration: Double, alphaBlur: Double, alphaColor: Double, viewToPresent: UIView, sendToBack: Bool = true, animation: (() -> ())? = nil, completion: (() -> ())? = nil) {
        
        self.blurView.frame = viewToPresent.frame
        
        viewToPresent.addSubview(self.blurView)
        
        if sendToBack {
            
            viewToPresent.sendSubview(toBack: self.blurView)
        }
        
        UIView.animate(withDuration: TimeInterval(duration), animations: {
            
            if let animation = animation {
                
                animation()
            }
            
            self.blurView.alpha = CGFloat(alphaBlur)
            
            viewToPresent.backgroundColor = self.color.withAlphaComponent(CGFloat(alphaColor))
            
        }) { (Bool) in
            
            if let completion = completion {
                
                completion()
            }
            
        }
        
        self.alphaColor = alphaColor
        
        self.alphaBlur = alphaBlur
    }
    
    func dismiss() {
        
        self.blurView.alpha = 0
    }
}
