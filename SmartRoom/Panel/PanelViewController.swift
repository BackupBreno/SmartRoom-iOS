//
//  PanelViewController.swift
//  SmartRoom
//
//  Created by Breno Aquino on 30/09/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit

class PanelViewController: UIViewController, LightSystemServiceDelegate {
    
    var isLightOn = false
    
    @IBOutlet weak var lightControl: UIButton!
    
    var serviceLightSystem: LightSystemService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.serviceLightSystem = LightSystemService(delegate: self)
    }
    
    // MARK: - Actions
    
    @IBAction func turnLight(_ sender: Any) {
        
        if self.isLightOn {
            
            self.lightControl.setImage(#imageLiteral(resourceName: "Light_Off"), for: .normal)
            
            self.serviceLightSystem.postLightSystemGreen(turnOnLed: false)
            
        } else {
            
            self.lightControl.setImage(#imageLiteral(resourceName: "Light_On"), for: .normal)
            
            self.serviceLightSystem.postLightSystemGreen(turnOnLed: true )
        }
        
        self.isLightOn = !self.isLightOn
    }
    
    // MARK: - Requests
    
    func postLightSystemGreenSuccess() {
        
        print("Led ON")
    }
    
    func postLightSystemGreenFailure() {
        
        print("Led OFF")
    }
}
