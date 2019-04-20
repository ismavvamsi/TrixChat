//
//  ChatForm.swift
//  TrixChat
//
//  Created by Vamsikrishna, Tangudu on 4/10/19.
//  Copyright © 2019 Vamsikrishna, Tangudu. All rights reserved.
//

import Foundation
import SwiftyJSON

class ChatForm{
    
    var fieldName : String
    var type : String
    var maxLength:String
    var validation:String
    var mandatory:Bool
    
    init() {
        self.fieldName = String()
        self.type = String()
        self.maxLength = String()
        self.validation = String()
        self.mandatory = Bool()
    }
    convenience init (json : JSON){
        self.init()
        self.fieldName = json["fieldName"].stringValue
        self.type = json["type"].stringValue
        self.maxLength = json["maxLength"].stringValue
        self.validation = json["validation"].stringValue
        self.mandatory = json["mandatory"].boolValue
    }
}
