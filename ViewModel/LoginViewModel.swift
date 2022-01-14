//
//  LoginViewModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//
import Foundation
import UIKit
import ObjectMapper
import Alamofire

protocol LoginDelegate: AnyObject {
    func loginDelegate(data: LoginModel)
}

class LoginViewModel: LoginDelegateService{
    weak var delegate: LoginDelegate?
    var loginModel: LoginModel?
    var listModel: ListModel?
    var detailModel: DetailModel?
    func loginData(data: LoginModel) {
        // receive data
        self.loginModel = data
        delegate?.loginDelegate(data: self.loginModel!)
        
    }
    func loginUser(phone: String, pass: String){
        LoginService.shared.delegate = self
        LoginService.shared.login(phone: phone, pass: pass)
    }
}

extension LoginViewModel{
    func listItem(complete: (() -> Void)?)  {
        let url = URL.init(string: "https://testing-api.vieon.vn/backend/cm/v5/ribbon/d0ce2475-5ffe-4892-b0d1-15e0fe0fdbef?limit=10&page=0&platform=ios&ui=012021")
        
        APIPortal.shared.requestApiWith(url: url!, menthodApi: .get, parameters: nil, encoding: JSONEncoding.default, header: ["content-type": "application/json", "Accept-Language": TimeZone.current.identifier ],complete: { (json) in
            if let model = ListModel.init(JSONString: json){
                self.listModel = model
                complete?()
            }
        }, fail: {
            print("fail")
            
        })
        
    }
}

extension LoginViewModel{
    func detailItem(complete: (() -> Void)?, id: String)  {
        let url = URL.init(string: "https://testing-api.vieon.vn/backend/cm/v5/content/\(id)")
        APIPortal.shared.requestApiWith(url: url!, menthodApi: .get, parameters: nil, encoding: JSONEncoding.default, header: ["content-type": "application/json", "Accept-Language": TimeZone.current.identifier ],complete: { (json) in
            if let model = DetailModel.init(JSONString: json){
                self.detailModel = model
                complete?()
            }
        }, fail: {
            print("fail")
            
        })
        
    }
}



