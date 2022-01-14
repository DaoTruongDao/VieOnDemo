//
//  Token.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 05/01/2022.
//

import Foundation
import UIKit
import Alamofire

//protocol TokenDelegateService: AnyObject {
//    func tokenData(data: DetailModel)
//}

class Token: NSObject{
//    weak var delegate: TokenDelegateService?
    static let shared = Token()
    var accessToken: String?
    
//    func getToken(token: String, id: String){
//        let url = URL.init(string: "https://testing-api.vieon.vn/backend/cm/v5/content/\(id)")
//        APIPortal.shared.requestApiWith(url: url!, menthodApi: .get, encoding: JSONEncoding.default, header: ["content-type": "application/json", "Accept-Language": TimeZone.current.identifier ,"Authorization": token]) { (json) in
//            let model = DetailModel.init(JSONString: json)
//            self.delegate?.tokenData(data: model!)
//            }fail: {
//                print("fail")
//            }
//    }
}


