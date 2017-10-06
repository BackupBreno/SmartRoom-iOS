//
//  ModemService.swift
//  SmartRoom
//
//  Created by Breno Aquino on 05/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol ModemServiceDelegate {
    
    func postModemSuccess()
    
    func postModemFailure()
}

class ModemService {
    
    var delegate: ModemServiceDelegate!
    
    var postModemRequest: Request?
    
    init(delegate: ModemServiceDelegate) {
        
        self.delegate = delegate
    }
    
    func postModem(turnOnModem: Bool) {
        
        self.postModemRequest?.cancel()
        
        self.postModemRequest = RequestFactory.postModem(state: turnOnModem ? 1 : 0)?.validate().responseObject(completionHandler: { (response: DataResponse<Intermediary>) in
            
            switch response.result {
                
            case .success:
                
                if let modem = response.value {
                    
                    Room.updateModem(state: modem.state)
                }
                
                self.delegate.postModemSuccess()
                
            case .failure:
                
                self.delegate.postModemFailure()
            }
        })
    }
}
