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

protocol LightSystemServiceDelegate {
    
    func postLightSystemGreenSuccess()
    
    func postLightSystemGreenFailure()
}

class LightSystemService {
    
    var delegate: LightSystemServiceDelegate!
    
    var postLightSystemRequest: Request?
    
    init(delegate: LightSystemServiceDelegate) {
        
        self.delegate = delegate
    }
    
    func postLightSystemGreen(turnOnLed: Bool) {
        
        self.postLightSystemRequest?.cancel()
        
        self.postLightSystemRequest = RequestFactory.postLedSystemGreenState(state: turnOnLed ? 1 : 0)?.validate().responseObject(completionHandler: { (response: DataResponse<Light>) in
            
            switch response.result {
                
            case .success:
                
                self.delegate.postLightSystemGreenSuccess()
                
            case .failure:
                
                self.delegate.postLightSystemGreenFailure()
            }
        })
    }
}
