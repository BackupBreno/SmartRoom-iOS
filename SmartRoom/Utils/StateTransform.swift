//
//  StateTransform.swift
//  SmartRoom
//
//  Created by Breno Aquino on 05/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import Foundation
import ObjectMapper

class StateTransform: TransformType {
    
    typealias Object = Bool
    typealias JSON = String
    
    init() {
        
    }
    
    func transformFromJSON(_ value: Any?) -> Bool? {
        
        if let value = value as? String {
            
            return Int(value) == 1 ? true : false
        }
        
        return nil
    }
    
    func transformToJSON(_ value: Bool?) -> String? {
        
        if let value = value {
            
            return String(value ? 1 : 0)
        }
        
        return nil
    }
}

