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
    
    @IBOutlet weak var lightButton: UIButton!
    
    @IBOutlet weak var lightView: UIView!
    @IBOutlet weak var routerView: UIView!
    @IBOutlet weak var modemView: UIView!
    @IBOutlet weak var restartView: UIView!
    @IBOutlet weak var tvView: UIView!
    @IBOutlet weak var airView: UIView!
    @IBOutlet weak var allThings: UIView!
    @IBOutlet weak var sleepMode: UIView!
    @IBOutlet weak var gameMode: UIView!
    @IBOutlet weak var studyMode: UIView!
    @IBOutlet weak var movieMode: UIView!
    @IBOutlet weak var generecView: UIView!
    
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
        self.loadingEffect()
    }
    
    // MARK: - General Function
    
    func reloadButtonsView() {
        
        self.turnWithEffect(view: self.lightView, toOn: self.room.lightIsOn, duration: 0.3, closure: {
            
            if self.room.lightIsOn {
                
                self.lightButton.setImage(#imageLiteral(resourceName: "Light_On"), for: .normal)
                
            } else {
                
                self.lightButton.setImage(#imageLiteral(resourceName: "Light_Off"), for: .normal)
            }
        })
        
        self.turnWithEffect(view: self.routerView, toOn: self.room.routerIsOn, duration: 0.3)
        
        self.turnWithEffect(view: self.modemView, toOn: self.room.modemIsOn, duration: 0.3)
        
        self.turnWithEffect(view: self.airView, toOn: self.room.airIsOn, duration: 0.3)
    }
    
    func turnWithEffect(view: UIView, toOn: Bool, duration: Double, closure: (() -> ())? = nil) {
        
        UIView.animate(withDuration: duration) {
            
            if let closure = closure {
                
                closure()
            }
            
            if toOn {
                
                view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
                
            } else {
                
                view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            }
        }
    }
    
    func turnAllEffect(toOn: Bool) {
        
        if toOn {
            
            self.lightView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.routerView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.modemView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.restartView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.tvView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.airView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.allThings.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.sleepMode.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.gameMode.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.studyMode.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.movieMode.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
            self.generecView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.85)
            
        } else {
            
            self.lightView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.routerView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.modemView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.restartView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.tvView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.airView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.allThings.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.sleepMode.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.gameMode.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.studyMode.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.movieMode.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
            
            self.generecView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
        }
    }
    
    func loadingEffect() {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.turnAllEffect(toOn: true)
            
        }) { (isEnd: Bool) in
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.turnAllEffect(toOn: false)
                
            }, completion: { (Bool) in
                
                if self.isLoading {
                    
                    self.loadingEffect()
                    
                } else {
                    
                    if !self.isSuccess {
                        
                        return
                    }
                    
                    self.reloadButtonsView()
                }
            })
        }
    }
    
    // MARK: - Actions
    
    @IBAction func refreshAllStates(_ sender: Any) {
        
        self.roomService.getAllStates()
        self.isLoading = true
        self.loadingEffect()
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
        
        self.turnWithEffect(view: self.lightView, toOn: self.room.lightIsOn, duration: 0.3, closure: {
            
            if self.room.lightIsOn {
                
                self.lightButton.setImage(#imageLiteral(resourceName: "Light_On"), for: .normal)
                
            } else {
                
                self.lightButton.setImage(#imageLiteral(resourceName: "Light_Off"), for: .normal)
            }
        })
    }
    
    func postLightFailure() {

        print("Light - Failure")
    }
}

// MARK: Router
extension PanelViewController: RouterServiceDelegate {
    
    func postRouterSuccess() {
        
        self.room = Room.get()
        
        self.turnWithEffect(view: self.routerView, toOn: self.room.routerIsOn, duration: 0.3)
    }
    
    func postRouterFailure() {
        
        print("Router - Failure")
    }
}

// MARK: Modem
extension PanelViewController: ModemServiceDelegate {
    
    func postModemSuccess() {
        
        self.room = Room.get()
        
        self.turnWithEffect(view: self.modemView, toOn: self.room.modemIsOn, duration: 0.3)
    }
    
    func postModemFailure() {
        
        print("Modem - Failure")
    }
}
