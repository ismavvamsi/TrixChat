//
//  WebServices.swift
//  SwipeStudio
//
//  Created by Vamsi on 13/08/18.
//  Copyright © 2018 SwipeStudio. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import SVProgressHUD

class WebServices {
    
    static let sharedInstance = WebServices()
    
    var userDefaults = MyUserDefaults()

    //POST SnapChat Auth
    
//    func postLicenceCheck(url : String?, licenceKey:String?, completionHandler: @escaping (_ response: CheckLicenseResponse?, _ errorMsg:String?) -> ()){
//
//        var requestParams: [String: Any] = [:]
//        requestParams[RequestConstants.url.rawValue] = url
//        requestParams[RequestConstants.licenceKey.rawValue] = licenceKey
//
//        Alamofire.request(WS_POST_LICENCE_KEY,method: .post ,parameters : requestParams,encoding: JSONEncoding.default ).responseJSON {response in
//
//                if let body = response.result.value {
//                    let json = JSON(body)
//                    let responseBody = CheckLicenseResponse.init(json: json)
//                    let status = responseBody.status
//                    if status == "error" {
//                        completionHandler(responseBody, nil)
//                    }else{
//                        completionHandler(responseBody, nil)
//                    }
//                }else{
//                    completionHandler(nil, "Please enter valid credentials")
//                }
//            }
//        }
}
