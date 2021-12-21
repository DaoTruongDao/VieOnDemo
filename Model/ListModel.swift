//
//  ListModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 16/12/2021.
//

import Foundation
import ObjectMapper

class ListModel: Mappable {
    var id: String?
    var name: String?
    var type: Int?
    var display_image_type: Int?
    var is_premium: Int?
    var menus: [MenuModell]?
    var items: [ItemModel]?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map ["id"]
        name <- map ["name"]
        type <- map ["type"]
        display_image_type <- map ["display_image_type"]
        is_premium <- map ["is_premium"]
        menus <- map ["menus"]
        items <- map ["items"]
    }
 
}
class MenuModell: Mappable {
    var id: String?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
    }

}

class ItemModel: Mappable {
    var id: String?
    var group_id: String?
    var geo_check: Int?
    var type: Int?
    var category: Int?
    var title: String?
    var short_description: String?
    var genre: String?
    var resolution: Int?
    var images: imagesModel?
    var avg_rate: Int?
    var is_watchlater: Bool?
    var is_premium: Int?
    var is_new: Int?
    var episode: Int?
    var current_episode: Int?
    var seo: seoModel?
    var display_image_type: Int?
    var label_subtitle_audio: String?
    var label_public_day: String?
    var link_play: linkplayModel?
    var release_year: Int?
    var tags_display: [String]?
    var ranking: Int?
    var runtime: Int?
    var external_url: String?
    var allow_click: Int?
    var metadata: metadataModel?
    var season_name: String?
    var related_season: String?
    var age_range: String?
    var vod_schedule: vodModel?
    var is_favorite: Bool?
    var is_coming_soon: Int?
    var is_live: Int?
    var is_finish: Int?
    var start_time: Int?
    var end_time: Int?
    var option_direct: String?
    var tags: String?
    var is_premium_display: String?
    var award_description: String?
    var option_direct_package_id: Int?
    var odr: Int?
    var tags_genre_txt: String?
  
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        group_id <- map["group_id"]
        geo_check <- map["geo_check"]
        type <- map["type"]
        category <- map["category"]
        title <- map["title"]
        short_description <- map["short_description"]
        genre <- map["genre"]
        resolution <- map["resolution"]
        images <- map["images"]
        
        avg_rate <- map["avg_rate"]
        is_watchlater <- map["is_watchlater"]
        is_premium <- map["is_premium"]
        is_new <- map["is_new"]
        episode <- map["episode"]
        current_episode <- map["current_episode"]
        seo <- map["seo"]
        display_image_type <- map["display_image_type"]
        label_subtitle_audio <- map["label_subtitle_audio"]
        label_public_day <- map["label_public_day"]
        
        link_play <- map["link_play"]
        release_year <- map["release_year"]
        tags_display <- map["tags_display"]
        ranking <- map["ranking"]
        runtime <- map["runtime"]
        external_url <- map["external_url"]
        allow_click <- map["allow_click"]
        metadata <- map["metadata"]
        season_name <- map["season_name"]
        related_season <- map["related_season"]
        
        age_range <- map["age_range"]
        vod_schedule <- map["vod_schedule"]
        is_favorite <- map["is_favorite"]
        is_coming_soon <- map["is_coming_soon"]
        is_live <- map["is_live"]
        is_finish <- map["is_finish"]
        start_time <- map["start_time"]
        end_time <- map["end_time"]
        option_direct <- map["option_direct"]
        tags <- map["tags"]
        
        is_premium_display <- map["is_premium_display"]
        award_description <- map["award_description"]
        option_direct_package_id <- map["option_direct_package_id"]
        odr <- map["odr"]
        tags_genre_txt <- map["tags_genre_txt"]
    }

}
class imagesModel: Mappable {
    

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        thumbnail_hot_v4 <- map["thumbnail_hot_v4"]
        namethumbnail_big_v4 <- map["namethumbnail_big_v4"]
        carousel_app_v4 <- map["carousel_app_v4"]
        thumbnail_v4 <- map["thumbnail_v4"]
        poster_v4 <- map["poster_v4"]
        promotion_banner <- map["promotion_banner"]
        title_card_light <- map["title_card_light"]
        title_card_dark <- map["title_card_dark"]
        poster_original <- map["poster_original"]
        thumb_original <- map["thumb_original"]
        thumbnail_hot_v4_ntc <- map["thumbnail_hot_v4_ntc"]
        thumbnail_big_v4_ntc <- map["thumbnail_big_v4_ntc"]
        carousel_app_v4_ntc <- map["carousel_app_v4_ntc"]
        thumbnail_v4_ntc <- map["thumbnail_v4_ntc"]
        poster_v4_ntc <- map["poster_v4_ntc"]
        livetv_logo_light <- map["livetv_logo_light"]
        livetv_logo_dark <- map["livetv_logo_dark"]
        livetv_logo_light_11 <- map["livetv_logo_light_11"]
        livetv_logo_dark_11 <- map["livetv_logo_dark_11"]
        ribbon_detail_app <- map["ribbon_detail_app"]
    }
    var thumbnail_hot_v4: String?
    var namethumbnail_big_v4: String?
    var carousel_app_v4: String?
    var thumbnail_v4: String?
    var poster_v4: String?
    var promotion_banner: String?
    var title_card_light: String?
    var title_card_dark: String?
    var poster_original: String?
    var thumb_original: String?
    var thumbnail_hot_v4_ntc: String?
    var thumbnail_big_v4_ntc: String?
    var carousel_app_v4_ntc: String?
    var thumbnail_v4_ntc: String?
    var poster_v4_ntc: String?
    var livetv_logo_light: String?
    var livetv_logo_dark: String?
    var livetv_logo_light_11: String?
    var livetv_logo_dark_11: String?
    var ribbon_detail_app: String?

}

class seoModel: Mappable {
    
    var share_url: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        share_url <- map["share_url"]
    }
  
}
class linkplayModel: Mappable {
    
    var hls_link_play: String?
    var poster_link_play: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        hls_link_play <- map["hls_link_play"]
        poster_link_play <- map["poster_link_play"]
    }

}

class metadataModel: Mappable {
    var award: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        award <- map["award"]
    }
    
  
}
         
class vodModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        channel <- map["channel"]
        hour <- map["hour"]
    }
    
    var day: String?
    var channel: String?
    var hour: String?
    
}
         
           
       
        
          
           
