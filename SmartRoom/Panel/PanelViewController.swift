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
    var isLoading: Bool = false
    var isSuccess: Bool = false
    
    @IBOutlet weak var systemButton: BlurButton!
    
    @IBOutlet weak var modeSleepButton: BlurButton!
    
    @IBOutlet weak var modeGameButton: BlurButton!
    
    @IBOutlet weak var modeStudyButton: BlurButton!
    
    @IBOutlet weak var modeMovieButton: BlurButton!
    
    @IBOutlet weak var lightButton: BlurButton!
    
    @IBOutlet weak var routerButton: BlurButton!
    
    @IBOutlet weak var modemRouter: BlurButton!
    
    @IBOutlet weak var restartInternetButton: BlurButton!
    
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
        
        self.isLoading = true
    }
    
    // MARK: - General Function
    
    func reloadButtonsView() {
        
        
    }
    
    // MARK: - Actions
    
    @IBAction func refreshAllStates(_ sender: Any) {
        
        self.roomService.getAllStates()
        self.isLoading = true
    }
    
    @IBAction func lightButton(_ sender: Any) {
        
        if self.room.lightIsOn {
            
            self.lightService.postLight(turnOnLight: false)
            
        } else {
            
            self.lightService.postLight(turnOnLight: true)
        }
    }
    
    @IBAction func routerButton(_ sender: Any) {
        
        if self.room.routerIsOn {
            
            let alert = UIAlertController(title: "Atenção!", message: "Ao desligar o roteador o sistema será desativado e só poderá voltar manualemente. Deseja desligar mesmo assim?", preferredStyle: .alert)
            
            let alertCancel = UIAlertAction(title: "Cancelar", style: .default)
            
            let alertOk = UIAlertAction(title: "Desligar", style: .destructive) { (UIAlerAction) in
                
                self.routerService.postRouter(turnOnRouter: false)
            }
            
            alert.addAction(alertCancel)
            alert.addAction(alertOk)
            
            self.present(alert, animated: true)
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
        
        self.isLoading = false
        
        self.isSuccess = true
        
        self.room = Room.get()
    }
    
    func postRoomFailure() {
        
        self.isLoading = false
        
        self.isSuccess = false
        
        print("Room - Failure")
    }
}

// MARK: Light
extension PanelViewController: LightServiceDelegate {
    
    func postLightSuccess() {
        
        self.room = Room.get()
    }
    
    func postLightFailure() {

        print("Light - Failure")
    }
}

// MARK: Router
extension PanelViewController: RouterServiceDelegate {
    
    func postRouterSuccess() {
        
        self.room = Room.get()
    }
    
    func postRouterFailure() {
        
        print("Router - Failure")
    }
}

// MARK: Modem
extension PanelViewController: ModemServiceDelegate {
    
    func postModemSuccess() {
        
        self.room = Room.get()
    }
    
    func postModemFailure() {
        
        print("Modem - Failure")
    }
}
