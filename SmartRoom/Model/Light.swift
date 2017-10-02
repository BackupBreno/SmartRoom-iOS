//
//  Light.swift
//  SmartRoom
//
//  Created by Breno Aquino on 01/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Light: Object, Mappable {
    
    @objc dynamic var state: Int = 0
    
    required convenience init?(map: Map) {
        
        self.init()
    }
    
    func mapping(map: Map) {
        
        state   <-  map["active"]
    }
    
}
