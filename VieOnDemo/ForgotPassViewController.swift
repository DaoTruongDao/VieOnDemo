//
//  ForgotPassViewController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 20/08/2021.
//
import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore

class ForgotPassViewController: UIViewController {
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var oTP: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oTP.isHidden = true
        // Do any additional setup after loading the view.
    }
    var verfitication_id : String? = nil
    @IBAction func submit(_ sender: Any) {
        if oTP.isHidden{
            if !txtPhone.text!.isEmpty {
                Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                PhoneAuthProvider.provider().verifyPhoneNumber(txtPhone.text!, uiDelegate: nil) { (verificationID, error) in
                    if error != nil {
                        return
                        
                    }else{
                        self.verfitication_id = verificationID
                        self.oTP.isHidden = false
                    }
                }
            }else{
                print("Enter your phone number")
            }
        }else{
            if verfitication_id != nil {
                let  credential = PhoneAuthProvider.provider().credential(withVerificationID: verfitication_id!, verificationCode: oTP.text!)
                Auth.auth().signIn(with: credential) { (authData, error) in
                    if error != nil{
                        print(error.debugDescription)
                    }else{
                        print("AUTHENTICATION SUCCESS WITH - " + (authData?.user.phoneNumber! ?? "NO PHONE NUMBER"))
                    }
                }
            }else{
                print("Error in getting verfitication ID")
            }
        }
    }
}
