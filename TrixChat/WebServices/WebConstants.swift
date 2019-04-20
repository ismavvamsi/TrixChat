//
//  WebConstants.swift
//  SwipeStudio
//
//  Created by Vamsi on 13/08/18.
//  Copyright © 2018 SwipeStudio. All rights reserved.
//

import Foundation

let PROTOCOL: String = "http://"

let BASE_URL = "czchatmobile.c-zentrix.com/chatadmin/chatapi/client/"

let APPLICATION_URL: String = PROTOCOL + BASE_URL

//Post URLS

let WS_POST_LICENCE_KEY: String = APPLICATION_URL + ApiEndPoints.checkLicense
let WS_POST_CONNECT: String = APPLICATION_URL + ApiEndPoints.initializeChat
let WS_POST_FILTERUSE :String = APPLICATION_URL + ApiEndPoints.pushMessage
let WS_POST_MY_INFORMATION: String = APPLICATION_URL + ApiEndPoints.getChatDetails
let WS_POST_USER_LOGIN: String = APPLICATION_URL + ApiEndPoints.getChatMessage
let WS_POST_REFER :String = APPLICATION_URL + ApiEndPoints.closeAndSetChatFeedback
