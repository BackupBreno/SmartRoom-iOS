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
    
    static func postLight(state: Int) -> DataRequest? {
        
        let params: Parameters = ["active" : state]
        
        return Alamofire.request(baseURL + "light", method: .post, parameters: params, headers: nil)
    }
    
    static func postRouter(state: Int) -> DataRequest? {
        
        let params: Parameters = ["active" : state]
        
        return Alamofire.request(baseURL + "router", method: .post, parameters: params, headers: nil)
    }
    
    static func postModem(state: Int) -> DataRequest? {
        
        let params: Parameters = ["active" : state]
        
        return Alamofire.request(baseURL + "modem", method: .post, parameters: params, headers: nil)
    }
    
    static func getAllStates() -> DataRequest? {
        
        return Alamofire.request(baseURL + "allStates", method: .get, parameters: nil, headers: nil)
    }
}
