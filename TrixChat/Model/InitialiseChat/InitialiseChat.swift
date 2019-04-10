//
//  InitialiseChat.swift
//  TrixChat
//
//  Created by Vamsikrishna, Tangudu on 4/10/19.
//  Copyright © 2019 Vamsikrishna, Tangudu. All rights reserved.
//

import Foundation
import SwiftyJSON

class InitialiseChat{
    
    var statusCode : String
    var status : String
    var msg:String
    var chatStatus:String
    var agentId:String
    var chatSessionId:String
    var visitorId:String
    var agentName:String
    var connectedTo:String

    
    init() {
        self.statusCode = String()
        self.status = String()
        self.msg = String()
        self.chatStatus = String()
        self.agentId = String()
        self.chatSessionId = String()
        self.visitorId = String()
        self.agentName = String()
        self.connectedTo = String()
        
    }
    convenience init (json : JSON){
        self.init()
        self.statusCode = json["statusCode"].stringValue
        self.status = json["status"].stringValue
        self.msg = json["msg"].stringValue
        self.chatStatus = json["chatStatus"].stringValue
        self.agentId = json["agentId"].stringValue
        self.chatSessionId = json["chatSessionId"].stringValue
        self.agentName = json["agentName"].stringValue
        self.connectedTo = json["connectedTo"].stringValue
    }
}
