//
//  JSONArrayFormatter.swift
//  TrixChat
//
//  Created by Vamsikrishna, Tangudu on 4/10/19.
//  Copyright © 2019 Vamsikrishna, Tangudu. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONArrayFormatter {
    func chatForms(json: JSON) -> [ChatForm] {
        var responseArray: [ChatForm] = []
        for i in 0..<json.count {
            responseArray.append(ChatForm(json: json[i]))
        }
        return responseArray
}
}
