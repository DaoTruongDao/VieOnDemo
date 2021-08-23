//
//  ViewController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 20/07/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController , UITextFieldDelegate{
    
    var iconClick = false
    let imageicon = UIImageView()
    
    
    
    @IBOutlet weak var txtLine2: UITextField!
    
    @IBOutlet weak var txtLine: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    @IBOutlet weak var background: UIImageView!
    
    
    @IBAction func forgotPass(_ sender: Any) {
        self.performSegue(withIdentifier: "forgotPassSegue", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtPhone.delegate = self
        txtPass.delegate = self
        
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
    
//    @objc func leftAction() {
//            print("taped")
//        }
    
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
        
//        self.performSegue(withIdentifier: "singInSeque", sender: nil)
        let phone = "0355505111"
        let pass = "123456"
        
        if txtPhone.text == phone && txtPass.text == pass{
            print("Login Scuccess")
        }else if txtPhone.text != phone {
            UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn) {
                self.txtPhone.center.x += 10
            } completion: { (nil) in}
            UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn) {
                self.txtPhone.center.x -= 20
            } completion: { (nil) in}
            UIView.animate(withDuration: 0.1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn) {
                self.txtPhone.center.x += 10
            } completion: { (nil) in}
        }else if txtPass.text != pass {
            UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn) {
                self.txtPass.center.x += 10
            } completion: { (nil) in}
            UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn) {
                self.txtPass.center.x -= 20
            } completion: { (nil) in}
            UIView.animate(withDuration: 0.1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn) {
                self.txtPass.center.x += 10
            } completion: { (nil) in}
        }
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

         if(textField == txtPhone) || (textField == txtPass){
            let currentText = textField.text! + string
            return currentText.count <= 10
         }
         return true;
        }
        
}
    
