//
//  PanelRequestFactory.swift
//  SmartRoom
//
//  Created by Breno Aquino on 01/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class RequestFactory {
    
    static func postLedSystemGreenState(state: Int) -> DataRequest? {
        
        let params: Parameters = ["active" : state]
        
        return Alamofire.request(baseURL + "ledVerde", method: .post, parameters: params, headers: nil)
    }
}
