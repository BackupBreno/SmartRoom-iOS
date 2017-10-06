//
//  PanelViewController.swift
//  SmartRoom
//
//  Created by Breno Aquino on 30/09/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit

class PanelViewController: UIViewController {
    
    var roomService: RoomService!
    
    var lightService: LightService!
    var routerService: RouterService!
    var modemService: ModemService!
    
    var room: Room!
    
    @IBOutlet weak var lightView: UIView!
    @IBOutlet weak var lightButton: UIButton!
    
    @IBOutlet weak var routerView: UIView!
    
    @IBOutlet weak var modemView: UIView!
    
    @IBOutlet weak var restartView: UIView!
    
    @IBOutlet weak var tvView: UIView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = L10n.Panel.title
        
        self.roomService = RoomService(delegate: self)
        
        self.lightService = LightService(delegate: self)
        
        self.routerService = RouterService(delegate: self)
        
        self.modemService = ModemService(delegate: self)
        
        self.room = Room.get()
        
        self.roomService.getAllStates()
    }
    
    // MARK: - Actions
    
    @IBAction func lightButton(_ sender: Any) {
        
        if self.room.lightIsOn {
            
            self.lightService.postLight(turnOnLight: false)
            
        } else {
            
            self.lightService.postLight(turnOnLight: true)
        }
    }
    
    @IBAction func routerButton(_ sender: Any) {
        
        if self.room.routerIsOn {
            
            self.routerService.postRouter(turnOnRouter: false)
            
        } else {
            
            self.routerService.postRouter(turnOnRouter: true)
        }
    }
    
    @IBAction func modemButton(_ sender: Any) {
        
        if self.room.modemIsOn {
            
            self.modemService.postModem(turnOnModem: false)
            
        } else {
            
            self.modemService.postModem(turnOnModem: true)
        }
    }
    
    @IBAction func tvPowerButton(_ sender: Any) {
    }
}

// MARK: - Requests
// MARK: Room
extension PanelViewController: RoomServiceDelegate {
    
    func postRoomSuccess() {
        
        self.room = Room.get()
    }
    
    func postRoomFailure() {
        
        print("Room - Failure")
    }
}

// MARK: Light
extension PanelViewController: LightServiceDelegate {
    
    func postLightSuccess() {
        
        self.room = Room.get()
        
        if self.room.lightIsOn {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.lightButton.setImage(#imageLiteral(resourceName: "Light_On"), for: .normal)
                
                self.lightView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            })
            
        } else {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.lightButton.setImage(#imageLiteral(resourceName: "Light_Off"), for: .normal)
                
                self.lightView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            })
        }
    }
    
    func postLightFailure() {
        
        print("Light - Failure")
    }
}

// MARK: Router
extension PanelViewController: RouterServiceDelegate {
    
    func postRouterSuccess() {
        
        self.room = Room.get()
        
        if self.room.routerIsOn {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.routerView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            })
            
        } else {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.routerView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            })
        }
    }
    
    func postRouterFailure() {
        
        print("Router - Failure")
    }
}

// MARK: Modem
extension PanelViewController: ModemServiceDelegate {
    
    func postModemSuccess() {
        
        self.room = Room.get()
        
        if self.room.modemIsOn {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.modemView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            })
            
        } else {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.modemView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            })
        }
    }
    
    func postModemFailure() {
        
        print("Modem - Failure")
    }
}
