//
//  WebConstants.swift
//  SwipeStudio
//
//  Created by Vamsi on 13/08/18.
//  Copyright © 2018 SwipeStudio. All rights reserved.
//

import Foundation

let PROTOCOL: String = "http://"

let BASE_URL = "swipestudio:coffeeboard@qa.swipestudio.co/api/"

let APPLICATION_URL: String = PROTOCOL + BASE_URL

//Post URLS
let WS_POST_LOGIN: String = APPLICATION_URL + ApiEndPoints.postLogin
let WS_POST_CONNECT: String = APPLICATION_URL + ApiEndPoints.postconnect
let WS_POST_FILTERUSE :String = APPLICATION_URL + ApiEndPoints.postFiltersUse
let WS_POST_MY_INFORMATION: String = APPLICATION_URL + ApiEndPoints.getPersonalInfo
let WS_POST_USER_LOGIN: String = APPLICATION_URL + ApiEndPoints.postUserLogin
let WS_POST_REFER :String = APPLICATION_URL + ApiEndPoints.postMeRefer
let WS_POST_SIGNUP :String = APPLICATION_URL + ApiEndPoints.postSignUp
let WS_POST_VERIFY :String = APPLICATION_URL + ApiEndPoints.postVerify

//Get URLS
let WS_GET_HOMEFEED: String = APPLICATION_URL + ApiEndPoints.gethomefeed
let WS_GET_ORDERS: String = APPLICATION_URL + ApiEndPoints.getorders
let WS_GET_PROFILE: String = APPLICATION_URL + ApiEndPoints.getMeProfile
let WS_GET_MY_INFORMATION: String = APPLICATION_URL + ApiEndPoints.getPersonalInfo
let WS_GET_MY_ORDERS: String = APPLICATION_URL + ApiEndPoints.getMeOrders
let WS_GET_FILTERS: String = APPLICATION_URL + ApiEndPoints.getFilters
let WS_GET_ME_REFER: String = APPLICATION_URL + ApiEndPoints.getMeRefer

