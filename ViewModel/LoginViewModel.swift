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
    
    func loginData(data: LoginModel) {
        // receive data
        self.loginModel = data
        print(loginModel?.accessToken ?? "")
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
        
        APIPortal.shared.requestApiWith(url: url!, menthodApi: .get, parameters: nil, encoding: JSONEncoding.default, header: ["content-type": "application/json", "Accept-Language": TimeZone.current.identifier ,"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MzMxMDE0NTksImp0aSI6ImIxZTkzZGY5YzU5MmU2Mjc1YjQwNGRhMTE3ZjRkMTZiIiwiYXVkIjoiIiwiaWF0IjoxNjMwNTA5NDU5LCJpc3MiOiJWaWVPbiIsIm5iZiI6MTYzMDUwOTQ1OCwic3ViIjoiYW5vbnltb3VzXzFDODNCRDQ0LUQ4RjYtNDM1QS1CQjZDLUNBNzlGREU3MDFGNi1kNTMxZDRkMjYzMmVmOTgyM2U0ZTI1MjBmOGU0NGY5NC0xNjMwNTA5NDU5Iiwic2NvcGUiOiJjbTpyZWFkIGNhczpyZWFkIGNhczp3cml0ZSBiaWxsaW5nOnJlYWQiLCJkaSI6IjFDODNCRDQ0LUQ4RjYtNDM1QS1CQjZDLUNBNzlGREU3MDFGNi1kNTMxZDRkMjYzMmVmOTgyM2U0ZTI1MjBmOGU0NGY5NC0xNjMwNTA5NDU5IiwidWEiOiJWaWVPTiUyMFN0YWdpbmcvMjEwNjI0MDAgQ0ZOZXR3b3JrLzk3OC4wLjcgRGFyd2luLzE4LjcuMCIsImR0IjoiaW9zIiwibXRoIjoiYW5vbnltb3VzX2xvZ2luIiwibWQiOiJpUGhvbmUgOCIsImlzcHJlIjowLCJ2ZXJzaW9uIjoiIn0.bo8Uhy0QTpq5iWMT7DUXA63GNuIrL9NljihC5oBxU3Y"],complete: { (json) in
            if let model = ListModel.init(JSONString: json){
                self.listModel = model
                complete?()
            }
        }, fail: {
            print("fail")
            
        })
        
    }
}



