//
//  TokenViewModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 06/01/2022.
//

import Foundation
import UIKit
import ObjectMapper
import Alamofire
protocol TokenDelegate: AnyObject {
    func tokenDelegate(data: DetailModel)
}
class TokenViewModel{
//    weak var delegate: TokenDelegate?
//    func tokenData(data: DetailModel) {
//        self.detailModel = data
//        delegate?.tokenDelegate(data: self.detailModel!)
//    }
//    var detailModel: DetailModel?
//    func getToken(token: String, id: String)  {
//        Token.shared.delegate = self
//        Token.shared.getToken(token: token, id: id)
//    }
}
