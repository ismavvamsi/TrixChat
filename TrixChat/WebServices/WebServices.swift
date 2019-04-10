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
    
    func postLogin(diaplayName : String?, bitMojiURL:String?,snapID:String?, completionHandler: @escaping (_ response: SnapChatLoginDetails?,_ errorMsg:String?) -> ()){
       
        var requestParams: [String: Any] = [:]
        requestParams[ResponseConstants.diaplayName.rawValue] = diaplayName
        requestParams[ResponseConstants.bitMojiURL.rawValue] = bitMojiURL ?? ""
        requestParams[ResponseConstants.snapID.rawValue] = snapID
        let headers : HTTPHeaders = [(ResponseConstants.sessionkey.rawValue) : self.userDefaults.get(Constants.sessionkey.rawValue)!]
        
        Alamofire.request(WS_POST_LOGIN,method: .post ,parameters : requestParams,encoding: JSONEncoding.default ,headers:headers).responseJSON {response in
                
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = SnapChatLoginDetails.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
            }
        }
   
    //POST Login
    func postUserLogin(email : String?, password:String?, completionHandler: @escaping (_ response: SnapChatLoginDetails?,_ errorMsg:String?) -> ()){
        
        var requestParams: [String: Any] = [:]
        requestParams[ResponseConstants.email.rawValue] = email
        requestParams[ResponseConstants.password.rawValue] = password
        var headers : HTTPHeaders
        if let headerValue = self.userDefaults.get(Constants.sessionkey.rawValue) {
            headers = [(ResponseConstants.sessionkey.rawValue) : headerValue]
        }else
        {
            headers = [(ResponseConstants.sessionkey.rawValue) : ""]
        }
        Alamofire.request(WS_POST_USER_LOGIN,method: .post ,parameters : requestParams,encoding: JSONEncoding.default ,headers:headers).responseJSON {response in
            
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = SnapChatLoginDetails.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
        }
    }
    
    //POST Connect
    func postConnect(email : String?, password:String?, completionHandler: @escaping (_ response: SnapChatLoginDetails?,_ errorMsg:String?) -> ()){
        

        var requestParams: [String: Any] = [:]
        requestParams[ResponseConstants.email.rawValue] = email
        requestParams[ResponseConstants.password.rawValue] = password
        
        let headers : HTTPHeaders = [(ResponseConstants.sessionkey.rawValue) : self.userDefaults.get(Constants.sessionkey.rawValue)!]
        
        Alamofire.request(WS_POST_CONNECT,method: .post ,parameters : requestParams,encoding: JSONEncoding.default ,headers:headers).responseJSON {response in
                
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = SnapChatLoginDetails.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
        }
    }
    //POST FilterUse
    func postFilterUse(filter_Id:String, completionHandler: @escaping (_ response: SnapChatLoginDetails?,_ errorMsg:String?) -> ()){
        
        var requestParams: [String: Any] = [:]
        requestParams[ResponseConstants.filterId.rawValue] = filter_Id
        
        let headers : HTTPHeaders = [(ResponseConstants.sessionkey.rawValue) : self.userDefaults.get(Constants.sessionkey.rawValue)!]
        
        Alamofire.request(WS_POST_FILTERUSE,method: .post ,parameters : requestParams,encoding: JSONEncoding.default ,headers:headers).responseJSON {response in
                
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = SnapChatLoginDetails.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "")
                }
        }
    }
    
    //POST SignUp
    func postSignUp(name:String,email:String,password:String,confirmPassword:String, completionHandler: @escaping (_ response: SnapChatLoginDetails?,_ errorMsg:String?) -> ()){
        var requestParams: [String: Any] = [:]
        requestParams[ResponseConstants.name.rawValue] = name
        requestParams[ResponseConstants.password.rawValue] = password
        requestParams[ResponseConstants.email.rawValue] = email
        requestParams[ResponseConstants.passwordConfirmation.rawValue] = confirmPassword
        
        Alamofire.request( WS_POST_SIGNUP, method: .post, parameters: requestParams, encoding: JSONEncoding.default)
            .validate().responseJSON { (response) in
                
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = SnapChatLoginDetails.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        self.userDefaults.set(Constants.sessionkey.rawValue, value: responseBody.sessionKey)
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
            }
        }
    
    //POST verify
    func postVerify(email:String,otp:String, completionHandler: @escaping (_ response: SnapChatLoginDetails?,_ errorMsg:String?) -> ()){
        
        var requestParams: [String: Any] = [:]
        requestParams[ResponseConstants.email.rawValue] = userDefaults.get("email")
        requestParams[ResponseConstants.otp.rawValue] = otp

        Alamofire.request( WS_POST_VERIFY, method: .post, parameters: requestParams, encoding: JSONEncoding.default)
            
            .validate().responseJSON { (response) in
                
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = SnapChatLoginDetails.init(json: json)
                    self.userDefaults.set(Constants.sessionkey.rawValue, value: responseBody.sessionKey)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
        }
    }
    
    
    //POST FilterUse
    func postPersonalInformation(email : String?, password:String?, completionHandler: @escaping (_ response: SnapChatLoginDetails?,_ errorMsg:String?) -> ()){
        
        var requestParams: [String: Any] = [:]
        requestParams[ResponseConstants.filterId.rawValue] = ""
        
                let headers : HTTPHeaders = [(ResponseConstants.sessionkey.rawValue) : self.userDefaults.get(Constants.sessionkey.rawValue)!]
                
                Alamofire.request(WS_POST_MY_INFORMATION,method: .post ,parameters : requestParams,encoding: JSONEncoding.default ,headers:headers).responseJSON {response in
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = SnapChatLoginDetails.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
        }
    }
    
    //Post Referralcode
    func postReferralCode(referralCode : String?, completionHandler: @escaping (_ response: SnapChatLoginDetails?,_ errorMsg:String?) -> ()){
        
        var requestParams: [String: Any] = [:]
        
        requestParams[ResponseConstants.referralCode.rawValue] = referralCode
            let headers : HTTPHeaders = [(ResponseConstants.sessionkey.rawValue) : self.userDefaults.get(Constants.sessionkey.rawValue)!]
            
        Alamofire.request(WS_POST_REFER,method: .post ,parameters : requestParams,encoding: JSONEncoding.default ,headers:headers).responseJSON {response in
       
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = SnapChatLoginDetails.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
        }
    }
    //Get Homefeed
    func getHomeFeed(sessionKey:String?, completionHandler: @escaping (_ response: DashboardResponse?,_ errorMsg:String?) -> ()){
        if let sessionKey = self.userDefaults.get(Constants.sessionkey.rawValue){
            let headerss: HTTPHeaders = [
                "x-api-key": sessionKey,
                "Accept": "application/json"
            ]
            
        Alamofire.request(WS_GET_HOMEFEED, headers: headerss).responseJSON { response in
                    if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = DashboardResponse.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
            }
        }
    }
    
    //Get Refer
    func getRefer(completionHandler: @escaping (_ response: ReferResponse?,_ errorMsg:String?) -> ()){
        if let sessionKey = self.userDefaults.get(Constants.sessionkey.rawValue){
            let headerss: HTTPHeaders = [
                "x-api-key": sessionKey,
                "Accept": "application/json"
            ]
            
            Alamofire.request(WS_GET_ME_REFER, headers: headerss).responseJSON { response in
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = ReferResponse.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
            }
        }
    }
    
    //Get Profile
    func getProfile( completionHandler: @escaping (_ response: ProfileResponse?,_ errorMsg:String?) -> ()){
        if let sessionKey = self.userDefaults.get(Constants.sessionkey.rawValue){
            let headerss: HTTPHeaders = [
                "x-api-key": sessionKey,
                "Accept": "application/json"
            ]
            
            Alamofire.request(WS_GET_PROFILE, headers: headerss).responseJSON { response in
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = ProfileResponse.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
            }
        }
    }
    
    
    
    //Get Personal Information
    
    func getPersonalInformation( completionHandler: @escaping (_ response: SettingsResponse?,_ errorMsg:String?) -> ()){
        if let sessionKey = self.userDefaults.get(Constants.sessionkey.rawValue){
            let headerss: HTTPHeaders = [
                "x-api-key": sessionKey,
                "Accept": "application/json"
            ]
            
            Alamofire.request(WS_GET_MY_INFORMATION, headers: headerss).responseJSON { response in
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = SettingsResponse.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
            }
        }
    }
    
    
    //Get Order 
    func getOrder(completionHandler: @escaping (_ response: OrdersResponse?,_ errorMsg:String?) -> ()){
        if let sessionKey = self.userDefaults.get(Constants.sessionkey.rawValue){
            let headerss: HTTPHeaders = [
                "x-api-key": sessionKey,
                "Accept": "application/json"
            ]
            
            Alamofire.request(WS_GET_MY_ORDERS, headers: headerss).responseJSON { response in
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = OrdersResponse.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
            }
        }
    }
    
    //Get Order
    func getFilters(categoryId:String,completionHandler: @escaping (_ response: FilterResponse?,_ errorMsg:String?) -> ()){
        if let sessionKey = self.userDefaults.get(Constants.sessionkey.rawValue){
            let headerss: HTTPHeaders = [
                "x-api-key": sessionKey,
                "Accept": "application/json",
                "category_id":categoryId
            ]
            
            Alamofire.request(WS_GET_FILTERS + categoryId, headers: headerss).responseJSON { response in
                if let body = response.result.value {
                    let json = JSON(body)
                    let responseBody = FilterResponse.init(json: json)
                    let status = responseBody.status
                    if status == ResponseConstants.status.rawValue {
                        completionHandler(responseBody, nil)
                    }else{
                        completionHandler(responseBody, nil)
                    }
                }else{
                    completionHandler(nil, "Please enter valid credentials")
                }
            }
        }
    }
    
}
