//
//  LoginViewModel.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//
import Foundation
import UIKit

class LoginViewModel {
    weak var delegate: ViewModelDelegate?
    var lis: ListModel?
    init(delegate: ViewModelDelegate? = nil) {
        self.delegate = delegate
    }
    
    func loginAccount(phone: String, pass: String) {
        APIPortal.shared.login(phone: phone, pass: pass) { (loginResponse) in
            print("Success", loginResponse)
        } failure: { (wrong) in
            
        }
    }
    func product(){
        
        APIPortal.shared.product { (productResponse) in
            print("Success", productResponse)
        } failure: {
            
        }

    }

    func list(complete: (() -> Void)?){
        APIPortal.shared.list { (listReponse) in
            print("Success", listReponse)
            self.lis = listReponse
            complete?()
        } failure: {

        }

    }
    
    
}
