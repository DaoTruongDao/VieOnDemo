//
//  LoginViewModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//
import Foundation
import UIKit


protocol LoginViewModelDelegate {
    func callLoginData(phone: String, pass: String)
}

class LoginViewModel: LoginViewModelDelegate, LoginDelegate{
   
    var loginService = LoginService()
    var delegate: LoginDelegate?
    var loginModel: LoginModel?
    

    func loginData(data: LoginModel) {
        self.loginModel = data
    }
    
    func callLoginData(phone: String, pass: String) {
        
        loginService.login(phone: phone, pass: pass)
        loginService.delegate = self
        print("Success",loginModel?.isFirstLogin)
        
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
    
