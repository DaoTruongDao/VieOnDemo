//
//  ResponseObjects.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//


import UIKit
import Foundation
import ObjectMapper

class ResponseObjects: NSObject {
    var status: String?
//    var error: ApiError?
    var more_info: [[String: Any]]?
    
    init?(json: [String: Any]?) {
        super.init()
        guard let json = json else {return}
        status = json["status"] as? String
        more_info = json["more_info"] as? [[String: Any]]
    }
    
    init?(json: [[String: Any]]?) {
        super.init()
    }
    
    func isSuccess() -> Bool {
        return status == "SUCCESS" ? true : false
    }
}

//class LoginResponse: ResponseObjects {
//    var employeeModel: LoginModel?
//
//    override init?(json: [String: Any]?) {
//        super.init(json: json)
//        guard let json = json?["data"] as? [String: Any],
//              let emModel = LoginModel.init(json: json) else {return}
//        emModel.accessToken = json["access_token"] as? String
//        employeeModel = emModel
//    }
//}

class ProductResponse: ResponseObjects {
    var productModel: [ProductModel]?
    
    override init?(json: [[String: Any]]?) {
        super.init(json: json)
        guard let json = json else {return}
        var prList: [ProductModel] = []
        for i in json {
            let product = ProductModel.init(json: i)
            if let pro = product {
                prList.append(pro)
            }
            
        }
        productModel = prList
    }
}

class LiveTvResponse: ResponseObjects {
    var livetvModel: LiveTvModel?
    override init?(json: [String: Any]?) {
        super.init(json: json)
        guard let liv = LiveTvModel.init(json: json ) else { return }
        livetvModel = liv
    }
}

//class VotingResponse: ResponseObjects{
//    var vot: VotingModel?
//    override init?(json: [String: Any]?) {
//        super.init(json: json)
//        guard let voting = VotingModel.init(JSON: json ) else { return }
//        vot = voting
//    }
//}

    

extension String {
    func convertToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func convertToArray() -> [[String: Any]]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    subscript(_ i: Int) -> String {
        let idx1 = index(startIndex, offsetBy: i)
        let idx2 = index(idx1, offsetBy: 1)
        return String(self[idx1..<idx2])
    }
    
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
       let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
       label.numberOfLines = 0
       label.text = self
       label.font = font
       label.sizeToFit()

       return label.frame.height
    }
}
