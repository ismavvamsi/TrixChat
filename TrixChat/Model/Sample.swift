//
//  Sample.swift
//  TrixChat
//
//  Created by Vamsikrishna, Tangudu on 4/10/19.
//  Copyright © 2019 Vamsikrishna, Tangudu. All rights reserved.
//

import Foundation
import SwiftyJSON

class SnapChatLoginDetails{
    var status : String
    var sessionKey : String
    var message:String
    var email:String
    //var messagee:[Message]
    //var data:Data
    
    init() {
        self.status = String()
        self.sessionKey = String()
        self.message = String()
        self.email = String()
        //self.data = ProfileData()
        //self.messagee = []
        
        
    }
    convenience init (json : JSON){
        self.init()
        self.status = json["status"].stringValue
        self.sessionKey = json["api_key"].stringValue
        self.message = json["message"].stringValue
        self.email = json["email"].stringValue
        //self.messagee = JSONArrayFormatter().formatMessage(json: json["message"])
        //self.data = ProfileData(json: json["data"])
    }
}

