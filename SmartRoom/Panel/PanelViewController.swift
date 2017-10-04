//
//  PanelViewController.swift
//  SmartRoom
//
//  Created by Breno Aquino on 30/09/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit

class PanelViewController: UIViewController, LightServiceDelegate {
    
    var isLightOn = false
    
    @IBOutlet weak var lightControl: UIButton!
    
    var serviceLightSystem: LightService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = L10n.Panel.title
        
        self.serviceLightSystem = LightService(delegate: self)
    }
    
    // MARK: - Actions
    
    @IBAction func turnLight(_ sender: Any) {
        
        if self.isLightOn {
            
            self.lightControl.setImage(#imageLiteral(resourceName: "Light_Off"), for: .normal)
            
            self.serviceLightSystem.postLight(turnOnLed: false)
            
        } else {
            
            self.lightControl.setImage(#imageLiteral(resourceName: "Light_On"), for: .normal)
            
            self.serviceLightSystem.postLight(turnOnLed: true )
        }
        
        self.isLightOn = !self.isLightOn
    }
    
    // MARK: - Requests
    
    func postLightSuccess() {
        
        print("Success")
    }
    
    func postLightFailure() {
        
        print("Failure")
    }
}
