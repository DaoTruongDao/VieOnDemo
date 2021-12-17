//
//  LiveTvModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 02/12/2021.
//

import Foundation

class LiveTvModel: BaseItem {
    var id: String?
//    var categorys: [String]?
    var vtvcab_drm_id: String?
    var main_channel_id: String?
    var title: String?
    var desscription: String?
    var slug: String?
    var link_play: String?
    var dash_link_play: String?
    var hls_link_play: String?
    var type: Int?
    var is_favorite: String?
    var is_catch_up: String?
    var seo: SeoModel?
    var image_link: String?
    var permission: Int?
    var packages: [PackModel] = []
    var programme: ProgrammeModel?
    var drm_service_name: String?
    var player_logo: String?
    var is_premium: Int?
    var geo_check: Int?
    var usi: String?
    var images: ImagesModel?
    var custom_ads: String?
    var play_links: PlayModel?
    var is_premium_display: String?
//    var package_deny_content: [Int]?
    var odr: Int?
    var network: String?
    var force_login: Int?
    
    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let json = json else { return }
        
        id = json["id"] as? String
//        categorys = json["categorys"] as? [String]
        vtvcab_drm_id = json["vtvcab_drm_id"] as? String
        main_channel_id = json["main_channel_id"] as? String
        title = json["title"] as? String
        desscription = json["desscription"] as? String
        slug = json["slug"] as? String
        link_play = json["link_play"] as? String
        dash_link_play = json["dash_link_play"] as? String
        hls_link_play = json["hls_link_play"] as? String
        
        type = json["type"] as? Int
        is_favorite = json["is_favorite"] as? String
        is_catch_up = json["is_catch_up"] as? String
        
        if let item = SeoModel.init(json: json["seo]"] as? [String: Any]) {
            seo = item
        }
        
        image_link = json["image_link"] as? String
        permission = json["permission"] as? Int
        var packagList: [PackModel] = []
        if let packages = json["packages"] as? [[String: Any]] {
            for index in 0..<packages.count {
                let dict = packages[index]
                if let item = PackModel.init(json: dict) {
                    packagList.append(item)
                }
            }
        }
        self.packages = packagList
        if let item = ProgrammeModel.init(json: json["programme]"] as? [String: Any]) {
            programme = item
        }
        
        drm_service_name = json["drm_service_name"] as? String
        player_logo = json["player_logo"] as? String
        is_premium = json["is_premium"] as? Int
        geo_check = json["geo_check"] as? Int
        usi = json["usi"] as? String
        
        if let item = ImagesModel.init(json: json["images]"] as? [String: Any]) {
            images = item
        }
        
        custom_ads = json["custom_ads"] as? String
        
        if let item = PlayModel.init(json: json["play_links]"] as? [String: Any]) {
            play_links = item
        }
        
        is_premium_display = json["is_premium_display"] as? String
//        package_deny_content = json["package_deny_content"] as? [Int]
        odr = json["odr"] as? Int
        network = json["network"] as? String
        force_login = json["force_login"] as? Int
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



class PackModel: BaseItem {
    var id: Int?
    var name: String?
    var price: Int?
    var period: String?
    var period_value: Int?
    
    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let json = json else { return }
        
        id = json["id"] as? Int
        name = json["name"] as? String
        price = json["price"] as? Int
        period = json["period"] as? String
        period_value = json["period_value"] as? Int
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class ProgrammeModel: BaseItem{
    var id: String?
    var title: String?
    var descriptionn: String?
    var slug: String?
    var type: Int?
    var time_start: Int?
    var time_end: Int?
    var duration: Int?
    var is_catch_up: Bool?
    var hls_link_play: String?
    var dash_link_play: String?
    var seo: SeooModel?
    var ott_disabled: Int?
    var images: ImagesModel?
    var is_coming_soon: Int?
    
    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let json = json else { return }
        
        id = json["id"] as? String
        title = json["title"] as? String
        descriptionn = json["descriptionn"] as? String
        slug = json["slug"] as? String
        type = json["type"] as? Int
        id = json["id"] as? String
        time_start = json["time_start"] as? Int
        time_end = json["time_end"] as? Int
        duration = json["duration"] as? Int
        is_catch_up = json["is_catch_up"] as? Bool
        
        hls_link_play = json["hls_link_play"] as? String
        dash_link_play = json["dash_link_play"] as? String
        
        if let item = SeooModel.init(json: json["seo]"] as? [String: Any]) {
            seo = item
        }
        ott_disabled = json["ott_disabled"] as? Int
        
        if let item = ImagesModel.init(json: json["images"] as? [String: Any]) {
            images =  item
        }
        
        is_coming_soon = json["is_coming_soon"] as? Int
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SeooModel: SeoModel {
    var title: String?
    var title_seo_tag: String?
    var desscription: String?
    var canonical_tag: String?
    var meta_robots: String?
    var seo_text: String?

    override init?(json: [String : Any]?) {
        super.init(json: json)
        guard let json = json else {return}
        
        title = json["title"] as? String
        title_seo_tag = json["title_seo_tag"] as? String
        desscription = json["desscription"] as? String
        canonical_tag = json["canonical_tag"] as? String
        meta_robots = json["meta_robots"] as? String
        seo_text = json["seo_text"] as? String
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PlayModel: BaseItem {
    var h264: HModel?
    var h265: HModel?
    
    override init?(json: [String : Any]?) {
        super.init(json: json)
        guard let json = json else {return}
        
        if let item = HModel.init(json: json["h264"] as? [String : Any]) {
            h264 = item
        }
        
        if let item = HModel.init(json: json["h265"] as? [String : Any]) {
            h265 = item
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HModel: BaseItem {
    var dash: String?
    var dash_backup_1: String?
    var dash_backup_2: String?
    var hls: String?
    var hls_backup_1: String?
    var hls_backup_2: String?
    
    override init?(json: [String : Any]?) {
        super.init(json: json)
        guard let json = json else {return}
        dash = json["dash"] as? String
        dash_backup_1 = json["dash_backup_1"] as? String
        dash_backup_2 = json["dash_backup_2"] as? String
        hls = json["hls"] as? String
        hls_backup_1 = json["hls_backup_1"] as? String
        hls_backup_2 = json["hls_backup_2"] as? String
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
 
   
