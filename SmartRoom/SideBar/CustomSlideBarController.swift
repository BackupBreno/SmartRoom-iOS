//
//  CustomSlideBarController.swift
//  SmartRoom
//
//  Created by Breno Aquino on 30/09/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class CustomSlideBarController: SlideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SlideMenuOptions.leftViewWidth = 210
        
        SlideMenuOptions.animationDuration = 0.5
        
        SlideMenuOptions.hideStatusBar = false
        
    }
}
