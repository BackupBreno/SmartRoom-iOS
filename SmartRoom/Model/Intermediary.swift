//
//  Intermediary.swift
//  SmartRoom
//
//  Created by Breno Aquino on 05/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Intermediary: Object, Mappable {
    
    @objc dynamic var state: Bool = false
    
    required convenience init?(map: Map) {
        
        self.init()
    }
    
    func mapping(map: Map) {
        
        state   <-  (map["active"], StateTransform())
    }
}

