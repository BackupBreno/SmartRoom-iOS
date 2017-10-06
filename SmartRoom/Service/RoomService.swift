//
//  RoomService.swift
//  SmartRoom
//
//  Created by Breno Aquino on 05/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol RoomServiceDelegate {
    
    func postRoomSuccess()
    
    func postRoomFailure()
}

class RoomService {
    
    var delegate: RoomServiceDelegate!
    
    var postRoomRequest: Request?
    
    init(delegate: RoomServiceDelegate) {
        
        self.delegate = delegate
    }
    
    func getAllStates() {
        
        self.postRoomRequest?.cancel()
        
        self.postRoomRequest = RequestFactory.getAllStates()?.validate().responseObject(completionHandler: { (response: DataResponse<Room>) in
            
            switch response.result {
                
            case .success:
                
                if let room = response.value {
                    
                    Room.save(room)
                }
                
                self.delegate.postRoomSuccess()
                
            case .failure:
                
                self.delegate.postRoomFailure()
            }
        })
    }
}

