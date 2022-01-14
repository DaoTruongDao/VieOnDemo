//
//  DetailModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 05/01/2022.
//

import Foundation
import ObjectMapper
import Alamofire

class DetailModel: Mappable {    
    var id: String?
    var groupId: String?
    var type: Int?
    var title: String?
    var images: ImageModel?
    var shortDescription: String?
    var longDescription: String?
    var tags: [tags]?
    var is_premium_display: String?
    var trailerLinhPlay: trailerModel?

    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        groupId <- map["group_id"]
        type <- map["type"]
        title <- map["title"]
        images <- map["images"]
        shortDescription <- map["short_description"]
        longDescription <- map["long_description"]
        tags <- map["tags"]
        is_premium_display <- map["is_premium_display"]
        trailerLinhPlay <- map["trailer_link_play"]
    }
}

class trailerModel: Mappable {

    var hls_link_play: String?
    var dash_link_play: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        hls_link_play <- map["hls_link_play"]
        dash_link_play <- map["dash_link_play"]
    }
}
class tags: Mappable {
    var id: String?
    var name: String?
    var type: String?
    var seo: seModel?
    var slug: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        type <- map["type"]
        seo <- map["seo"]
        slug <- map["slug"]
        
    }
}
class seModel: Mappable {
    var slug: String?
    var url: String?
    var url_redirect: String?
    var share_url: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        slug <- map["slug"]
        url <- map["url"]
        url_redirect <- map["url_redirect"]
        share_url <- map["share_url"]
    }
    
    
}

class ImageModel: Mappable {
    var thumbnailHotV4: String?
    var thumbnailBigV4: String?
    var carouselTvV4: String?
    var carouselAppV4: String?
    var carouselWebV4: String?
    var thumbnail_v4: String?
    var poster_v4: String?
    var promotion_banner: String?
    var title_card_light: String?
    var title_card_dark: String?
    var poster_original: String?
    var thumb_original: String?
    var thumbnail_hot_v4_ntc: String?
    var thumbnail_big_v4_ntc: String?
    var carousel_tv_v4_ntc: String?
    var carousel_app_v4_ntc: String?
    var carousel_web_v4_ntc: String?
    var thumbnail_v4_ntc: String?
    var poster_v4_ntc: String?
    var livetv_logo_light: String?
    var livetv_logo_dark: String?
    var livetv_logo_light_11: String?
    var livetv_logo_dark_11: String?
    var ribbon_detail_app: String?
    var ribbon_detail_web: String?
    var promotion_banner_sm: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        thumbnailHotV4 <- map["thumbnail_hot_v4"]
        thumbnailBigV4 <- map["thumbnail_big_v4"]
        carouselTvV4 <- map["carousel_tv_v4"]
        carouselAppV4 <- map["carousel_app_v4"]
        carouselWebV4 <- map["carousel_web_v4"]
        
        thumbnail_v4 <- map["thumbnail_v4"]
        poster_v4 <- map["poster_v4"]
        promotion_banner <- map["promotion_banner"]
        title_card_light <- map["title_card_light"]
        title_card_dark <- map["title_card_dark"]
        
        poster_original <- map["poster_original"]
        thumb_original <- map["thumb_original"]
        thumbnail_hot_v4_ntc <- map["thumbnail_hot_v4_ntc"]
        thumbnail_big_v4_ntc <- map["thumbnail_big_v4_ntc"]
        carousel_tv_v4_ntc <- map["carousel_tv_v4_ntc"]
        
        carousel_app_v4_ntc <- map["carousel_app_v4_ntc"]
        carousel_web_v4_ntc <- map["carousel_web_v4_ntc"]
        thumbnail_v4_ntc <- map["thumbnail_v4_ntc"]
        poster_v4_ntc <- map["poster_v4_ntc"]
        livetv_logo_light <- map["livetv_logo_light"]

        livetv_logo_dark <- map["livetv_logo_dark"]
        livetv_logo_light_11 <- map["livetv_logo_light_11"]
        livetv_logo_dark_11 <- map["livetv_logo_dark_11"]
        ribbon_detail_app <- map["ribbon_detail_app"]
        ribbon_detail_web <- map["ribbon_detail_web"]
        promotion_banner_sm <- map["promotion_banner_sm"]
    }
    
    
}


   
    
    
