//
//  ViewController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 20/07/2021.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftUI

class ViewController: UIViewController , UITextFieldDelegate{
    
    var iconClick = false
    let imageicon = UIImageView()
    
    
    @IBOutlet weak var wrongPhone: UILabel!
    @IBOutlet weak var wrongPass: UILabel!
    
    @IBOutlet weak var txtLine2: UITextField!
    
    @IBOutlet weak var txtLine: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var wrongPassAndPhone: UILabel!
    
    @IBAction func forgotPass(_ sender: Any) {
        self.performSegue(withIdentifier: "forgotPassSegue", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtPhone.delegate = self
        txtPass.delegate = self
        wrongPass.isHidden = true
        wrongPhone.isHidden = true
        wrongPassAndPhone.isHidden = true

        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButton
        

        
        navigationController?.navigationBar.tintColor = .white
        
        
        navigationController?.navigationBar.barStyle = .black
            
        background.image = UIImage(named: "background")
    
        txtLine.layer.borderColor = UIColor.gray.cgColor
        txtLine.layer.borderWidth = 1.0
        txtLine2.layer.borderColor = UIColor.gray.cgColor
        txtLine2.layer.borderWidth = 1.0
        
        imageicon.image = UIImage(named: "hide")
        
        
        let contentView = UIView()
        contentView.addSubview(imageicon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "hide")!.size.width, height: UIImage(named: "hide")!.size.height)
        
        imageicon.frame = CGRect(x: -10, y: 0, width: UIImage(named: "hide")!.size.width, height: UIImage(named: "hide")!.size.height)
        
        txtPass.rightView = contentView
        txtPass.rightViewMode = .always
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))        
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
    }

    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if iconClick {
            iconClick = false
            tappedImage.image = UIImage(named: "show")
            txtPass.isSecureTextEntry = false
        }
        else{
            iconClick = true
            tappedImage.image = UIImage(named: "hide")
            txtPass.isSecureTextEntry = true
        }
    }
    
    @IBAction func singIn_tap(_ sender: Any) {
        let myPhone = txtPhone.text!
        let myPass = txtPass.text!
        if myPhone.count == 10 && myPass.count >= 6{
            if myPass == "123456" && myPhone == "0355505111" {
                self.performSegue(withIdentifier: "loginSeque", sender: nil)
            }else {
                wrongPassAndPhone.isHidden = false
            }
        }
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        if textField == txtPhone {
            txtPhone.placeholder = "vd: 0901234567"
            txtPhone.textColor = UIColor.gray
            txtLine2.layer.borderColor = UIColor.white.cgColor
            txtLine2.layer.borderWidth = 1.0
        }
        if textField == txtPass {
            txtPass.placeholder = "6-20 ký tự"
            txtPass.textColor = UIColor.gray
            txtLine.layer.borderColor = UIColor.white.cgColor
            txtLine.layer.borderWidth = 1.0
        }
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField){
 
        if textField == txtPhone{
            let currentText = textField.text!
            if currentText.count < 10 {
                wrongPhone.isHidden = false
                txtLine2.layer.borderColor = UIColor.red.cgColor
                txtLine2.layer.borderWidth = 1.0
            }
            if txtPhone.text == "" {
                txtPhone.placeholder = "Số điện thoại"
                wrongPhone.isHidden = true
                txtLine2.layer.borderColor = UIColor.gray.cgColor
                txtLine2.layer.borderWidth = 1.0
            }
        }
        if textField == txtPass {
            let currentText = textField.text!
            if currentText.count > 20 || currentText.count < 8{
                wrongPass.isHidden = false
                txtLine.layer.borderColor = UIColor.red.cgColor
                txtLine.layer.borderWidth = 1.0
            }
            if txtPass.text == "" {
                txtPass.placeholder = "Mật Khẩu"
                wrongPass.isHidden = true
                txtLine.layer.borderColor = UIColor.gray.cgColor
                txtLine.layer.borderWidth = 1.0
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if(textField == txtPhone){
            let currentText = textField.text! + string
            return currentText.count <= 10
         }
        if textField == txtPass {
            let currentText = textField.text! + string
            return currentText.count <= 20
        }
         return true;
    }

}

    
