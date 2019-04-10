//
//  CheckLicenseResponse.swift
//  TrixChat
//
//  Created by Vamsikrishna, Tangudu on 4/10/19.
//  Copyright © 2019 Vamsikrishna, Tangudu. All rights reserved.
//

import Foundation
import SwiftyJSON

class CheckLicenseResponse{
    
    var statusCode : String
    var status : String
    var msg:String
    var client_id:String
    var chatStatus:String
    var chatForm:[ChatForm]
    
    init() {
        self.statusCode = String()
        self.status = String()
        self.msg = String()
        self.client_id = String()
        self.chatStatus = String()
        self.chatForm = []
    }
    convenience init (json : JSON){
        self.init()
        self.statusCode = json["statusCode"].stringValue
        self.status = json["status"].stringValue
        self.msg = json["msg"].stringValue
        self.client_id = json["client_id"].stringValue
        self.chatStatus = json["chatStatus"].stringValue
        self.chatForm = JSONArrayFormatter().chatForms(json: json["chatForm"])
    }
}
