//
//  VotingModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 02/12/2021.
//

import Foundation
import ObjectMapper

class VotingModel: Mappable {
    
    var code: Int?
    var msg: Int?
    var results: [resultModel] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        msg <- map["msg"]
        results <- map["results"]
    }
    

}

class resultModel: Mappable {

    
    var id: Int?
    var content: String?
    var partner_id_type: Int?
    var partner_id: String?
    var partner_slug: String?
    var image: String?
    var image_charts: String?
    var image_winner: String?
    var enabled_at: Int?
    var disabled_at: Int?
    var question_id: Int?
    var question_content: String?
    var name: String?
    var highlight: Int?
    var final_rank: Int?
    var status_enable: Bool?
    var color: String?
    var dialog_image: String?
    var rank: Int?
    var rank_change: Int?
    var total_vote: Int?
    var percent_vote: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id  <- map["id"]
        content  <- map["content"]
        partner_id_type  <- map["partner_id_type"]
        partner_id   <- map["partner_id"]
        partner_slug  <- map["partner_slug"]
        image <- map["image"]
        image_charts   <- map["image_charts"]
        image_winner    <- map["image_winner"]
        enabled_at  <- map["enabled_at"]
        disabled_at   <- map["disabled_at"]
        question_id  <- map["question_id"]
        question_content   <- map["question_content"]
        name  <- map["name"]
        highlight   <- map["highlight"]
        final_rank    <- map["final_rank"]
        status_enable   <- map["status_enable"]
        color   <- map["color"]
        dialog_image   <- map["dialog_image"]
        rank <- map["rank"]
        rank_change   <- map["rank_change"]
        total_vote <- map["total_vote"]
        percent_vote   <- map["percent_vote"]
    }
}
