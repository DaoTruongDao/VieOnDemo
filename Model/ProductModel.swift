//
//  ProductModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//

import Foundation

class ProductModel: BaseItem {
    var id: String?
    var name: String?
    var type: Int?
    var displayImageType: Int?
    var isPremium: Int?
    var menus: MenuModel?
//    var tags: [String]?
    var trackingData: TrackingModel?
    var seo: SeoModel?
    var geoCheck: Int?
    var properties: ProModel?
    var images: ImagesModel?
    var descriptionn: String?
    var recommendType: String?
    var displayFor: Int?
    var odr: Int?
    var durationTrans: Int?
    
    
    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let json = json else { return }
        
        id = json["id"] as? String
        name = json["name"] as? String
        type = json["type"] as? Int
        displayImageType = json["display_image_type"] as? Int
        isPremium = json["is_premium"] as? Int
        if let item = MenuModel.init(json: json["menus]"] as? [String: Any]) {
            menus = item
        }

//        tags = json["tags"] as? [String]
        if let item = TrackingModel.init(json: json["tracking_data]"] as? [String: Any]) {
            trackingData = item
        }
        
        if let item = SeoModel.init(json: json["seo]"] as? [String: Any]) {
            seo = item
        }
        
        geoCheck = json["geo_check"] as? Int
        
        if let item = ProModel.init(json: json["properties]"] as? [String: Any]) {
            properties = item
        }
        if let item = ImagesModel.init(json: json["images]"] as? [String: Any]) {
            images = item
        }
        descriptionn = json["id"] as? String
        recommendType = json["id"] as? String
        displayFor = json["display_for"] as? Int
        odr = json["odr"] as? Int
        durationTrans = json["duration_trans"] as? Int

    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuModel: BaseItem {
    var id: String?
    
    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let json = json else { return }
        
        id = json["id"] as? String
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TrackingModel: BaseItem {
    var recommendationId: String?
    var type: String?
    
    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let json = json else { return }
        
        recommendationId = json["recommendation_id"] as? String
        type = json["type"] as? String
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SeoModel: BaseItem {
    var slug: String?
    var url: String?
    var urlRedirect: String?
    var shareUrl: String?
    
    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let json = json else { return }
        
        slug = json["slug"] as? String
        url = json["url"] as? String
        urlRedirect = json["url_redirect"] as? String
        shareUrl = json["share_url"] as? String
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class ProModel: BaseItem {
    var line: Int?
    var isTitle: Int?
    var isSlide: Int?
    var isRefresh: Int?
    var isViewAll: Int?
    var thumb: Int?
    
    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let json = json else { return }
        
        line = json["line"] as? Int
        isTitle = json["is_title"] as? Int
        isSlide = json["is_slide"] as? Int
        isRefresh = json["is_refresh"] as? Int
        isViewAll = json["is_view_all"] as? Int
        thumb = json["thumb"] as? Int
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ImagesModel: BaseItem {
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

    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let json = json else { return }

        thumbnailHotV4 = json["thumbnail_hot_v4"] as? String
        thumbnailBigV4 = json["thumbnail_big_v4"] as? String
        carouselTvV4 = json["carousel_tv_v4"] as? String
        carouselAppV4 = json["carousel_app_v4"] as? String
        carouselWebV4 = json["carousel_web_v4"] as? String
        thumbnail_v4 = json["thumbnail_v4"] as? String
        poster_v4 = json["poster_v4"] as? String
        promotion_banner = json["promotion_banner"] as? String
        title_card_light = json["title_card_light"] as? String
        title_card_dark = json["title_card_dark"] as? String
        poster_original = json["poster_original"] as? String
        thumb_original = json["thumb_original"] as? String
        thumbnail_hot_v4_ntc = json["thumbnail_hot_v4_ntc"] as? String
        thumbnail_big_v4_ntc = json["thumbnail_big_v4_ntc"] as? String
        carousel_tv_v4_ntc = json["carousel_tv_v4_ntc"] as? String
        carousel_app_v4_ntc = json["carousel_app_v4_ntc"] as? String
        carousel_web_v4_ntc = json["carousel_web_v4_ntc"] as? String
        thumbnail_v4_ntc = json["thumbnail_v4_ntc"] as? String
        poster_v4_ntc = json["poster_v4_ntc"] as? String
        livetv_logo_light = json["livetv_logo_light"] as? String
        livetv_logo_dark = json["livetv_logo_dark"] as? String
        livetv_logo_light_11 = json["livetv_logo_light_11"] as? String
        livetv_logo_dark_11 = json["livetv_logo_dark_11"] as? String
        ribbon_detail_app = json["ribbon_detail_app"] as? String
        ribbon_detail_web = json["ribbon_detail_web"] as? String
        promotion_banner_sm = json["promotion_banner_sm"] as? String

        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

