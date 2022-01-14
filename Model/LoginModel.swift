//
//  LoginModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//

import Foundation
import ObjectMapper


class LoginModel: Mappable {
   
 
    
    var accessToken: String?
    var isFirstLogin: Bool?
    var profile: EquipmentMoreModel?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        accessToken <- map["access_token"]
        isFirstLogin <- map["is_first_login"]
        profile <- map["profile"]
    }
}

class EquipmentMoreModel: Mappable {
  
    var id: String?
    var status: Int?
    var email: String?
    var emailVerified: Bool?
    var phoneVerified: Bool?
    var seri: String?
    var modal: String?
    var gender: Int?
    var trialCode: String?
    var isPremium: Int?
    var dob: String?
    var givenName: Int?
    var address: String?
    var uuCode: String?
    var allowPush: Int?
    var avatar: String?
    var haveSearchHistory: Bool?
    var haveWatchlater: Bool?
    var haveMore: Bool?
    var showGuestidFlow: Bool?
//    var dataGuestidFlow: String?
    var createdAt: Int?
    var isRefreshToken: Bool?
    var phoneRequired: Bool?
    var passwordRequired: Bool?
    var versions: [MoreInfoModel] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        status <- map["status"]
        email <- map["email"]
        emailVerified <- map["email_verified"]
        phoneVerified <- map["phone_verified"]
        seri <- map["seri"]
        modal <- map["modal"]
        gender <- map["gender"]
        trialCode <- map["trial_code"]
        isPremium <- map["is_premium"]
        dob <- map["dob"]
        givenName <- map["given_name"]
        address <- map["address"]
        uuCode <- map["uu_code"]
        allowPush <- map["allow_push"]
        avatar <- map["avatar"]
        haveSearchHistory <- map["have_search_history"]
        haveWatchlater <- map["have_watchlater"]
        haveMore <- map["have?_more"]
        showGuestidFlow <- map["show_guestid_flow"]
//        dataGuestidFlow <- map["data_guestid_flow"]
        createdAt <- map["created_at"]
        isRefreshToken <- map["is_refresh_token"]
        phoneRequired <- map["phone_required"]
        passwordRequired <- map["password_required"]
        versions <- map["versions"]
    }

}

class MoreInfoModel: Mappable {

    
    var version: Int?
    var method: String?
    var deviceId: String?
    var deviceName: String?
    var platform: String?
    
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        version <- map["version"]
        method <- map["method"]
        deviceId <- map["device_id"]
        deviceName <- map["device_name"]
        platform <- map["platform"]
    }
        

}


