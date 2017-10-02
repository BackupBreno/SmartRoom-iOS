//
//  LightService.swift
//  SmartRoom
//
//  Created by Breno Aquino on 02/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol LightServiceDelegate {
    
    func postLightSuccess()
    
    func postLightFailure()
}

class LightService {
    
    var delegate: LightServiceDelegate!
    
    var postLightRequest: Request?
    
    init(delegate: LightServiceDelegate) {
        
        self.delegate = delegate
    }
    
    func postLight(turnOnLed: Bool) {
        
        self.postLightRequest?.cancel()
        
        self.postLightRequest = RequestFactory.postLightState(state: turnOnLed ? 1 : 0)?.validate().responseObject(completionHandler: { (response: DataResponse<Light>) in
            
            switch response.result {
                
            case .success:
                
                self.delegate.postLightSuccess()
                
            case .failure:
                
                self.delegate.postLightFailure()
            }
        })
    }
}
