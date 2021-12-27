//
//  LoginViewModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//
import Foundation
import UIKit

protocol LoginDelegate: AnyObject{
    func loginData(data: LoginModel)
}

class LoginViewModel{
 
    weak var delegate: LoginDelegate?
    var loginModel: LoginModel?
    
    func loginUser(phone: String, pass: String){
        LoginService.shared.login(phone: phone, pass: pass)

    }
    
}

//    weak var delegate: ViewModelDelegate?
//    weak var delegateList: ListDelegate?
    
//    init(delegate: ViewModelDelegate? = nil) {
//        self.delegate = delegate
//    }

//    func loginAccount(phone: String, pass: String) {
//        APIPortal.shared.login(phone: phone, pass: pass) { (loginResponse) in
//            print("Success", loginResponse)
//        } failure: { (wrong) in
//
//        }
//    }
//    func product(){
//
//        APIPortal.shared.product { (productResponse) in
//            print("Success", productResponse)
//        } failure: {
//
//        }
//
//    }
//
//    func list(complete: (() -> Void)?){
//        APIPortal.shared.list { (listReponse) in
//            print("Success", listReponse)
//            self.lis = listReponse
//            complete?()
//        } failure: {
//
//        }
//
//    }
    
