//
//  RouterService.swift
//  SmartRoom
//
//  Created by Breno Aquino on 05/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol RouterServiceDelegate {
    
    func postRouterSuccess()
    
    func postRouterFailure()
}

class RouterService {
    
    var delegate: RouterServiceDelegate!
    
    var postRouterRequest: Request?
    
    init(delegate: RouterServiceDelegate) {
        
        self.delegate = delegate
    }
    
    func postRouter(turnOnRouter: Bool) {
        
        self.postRouterRequest?.cancel()
        
        self.postRouterRequest = RequestFactory.postRouter(state: turnOnRouter ? 1 : 0)?.validate().responseObject(completionHandler: { (response: DataResponse<Intermediary>) in
            
            switch response.result {
                
            case .success:
                
                if let router = response.value {
                    
                    Room.updateRouter(state: router.state)
                }
                
                self.delegate.postRouterSuccess()
                
            case .failure:
                
                self.delegate.postRouterFailure()
            }
        })
    }
}

