//
//  Room.swift
//  SmartRoom
//
//  Created by Breno Aquino on 05/10/2017.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Room: Object, Mappable {
    
    @objc dynamic var name: String?
    
    @objc dynamic var lightIsOn: Bool = false
    
    @objc dynamic var routerIsOn: Bool = true
    
    @objc dynamic var modemIsOn: Bool = true
    
    @objc dynamic var airIsOn: Bool = false
    
    required convenience init?(map: Map) {
        
        self.init()
    }
    
    override static func primaryKey() -> String? {
        
        return "name"
    }
    
    func mapping(map: Map) {
        
        self.name          <-   map["roomName"]
        self.lightIsOn     <-  (map["light"], StateTransform())
        self.routerIsOn    <-  (map["router"], StateTransform())
        self.modemIsOn     <-  (map["modem"], StateTransform())
        self.airIsOn       <-  (map["air"], StateTransform())
    }
}

extension Room {
    
    static func save(_ room: Room) {
        
        try! realmInstance.write {
            
            realmInstance.add(room, update: true)
        }
    }
    
    static func get() -> Room? {
        
        return realmInstance.objects(Room.self).first
    }
    
    static func updateLight(state: Bool) {
        
        if let room = realmInstance.objects(Room.self).first {
            
            try! realmInstance.write {
                
                room.setValue(state, forKey: "lightIsOn")
            }
        }
    }
    
    static func updateRouter(state: Bool) {
        
        if let room = realmInstance.objects(Room.self).first {
            
            try! realmInstance.write {
                
                room.setValue(state, forKey: "routerIsOn")
            }
        }
    }
    
    static func updateModem(state: Bool) {
        
        if let room = realmInstance.objects(Room.self).first {
            
            try! realmInstance.write {
                
                room.setValue(state, forKey: "modemIsOn")
            }
        }
    }
}
