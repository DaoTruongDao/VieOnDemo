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

class ViewController: UIViewController , UITextFieldDelegate, UICollectionViewDelegate,UICollectionViewDataSource{

    var iconClick = false
    let imageicon = UIImageView()

    @IBOutlet weak var collectionview: UICollectionView?
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var wrongPhone: UILabel!
    @IBOutlet weak var wrongPass: UILabel!
    
    @IBOutlet weak var txtLine2: UITextField!
    
    @IBOutlet weak var txtLine: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var pass: UILabel!
    @IBOutlet weak var wrongPassAndPhone: UILabel!
    
    @IBAction func forgotPass(_ sender: Any) {
        self.performSegue(withIdentifier: "forgotPassSegue", sender: nil)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtPhone?.delegate = self
        txtPass?.delegate = self
        wrongPass?.isHidden = true
        wrongPhone?.isHidden = true
        wrongPassAndPhone?.isHidden = true
        phone?.isHidden = true
        pass?.isHidden = true
        
        btnLogin?.isEnabled = false
        btnLogin?.alpha = 0.5
        
        collectionview?.delegate = self
        collectionview?.dataSource = self
        collectionview?.backgroundColor = UIColor.black
        collectionview?.tintColor = UIColor.white

        
        
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButton

        navigationController?.navigationBar.tintColor = .white
    
        navigationController?.navigationBar.barStyle = .black
            
        background?.image = UIImage(named: "background")
    
        txtLine?.layer.borderColor = UIColor.gray.cgColor
        txtLine?.layer.borderWidth = 1.0
        txtLine2?.layer.borderColor = UIColor.gray.cgColor
        txtLine2?.layer.borderWidth = 1.0
        
        imageicon.image = UIImage(named: "hide")
        
        
        let contentView = UIView()
        contentView.addSubview(imageicon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "hide")!.size.width, height: UIImage(named: "hide")!.size.height)
        
        imageicon.frame = CGRect(x: -10, y: 0, width: UIImage(named: "hide")!.size.width, height: UIImage(named: "hide")!.size.height)
        
        txtPass?.rightView = contentView
        txtPass?.rightViewMode = .always
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
        if myPhone.count == 10 && myPass.count >= 6 {
            if myPass == "123456" && myPhone == "0355505111" {
                self.performSegue(withIdentifier: "loginSeque", sender: nil)
            }else if myPass != "123456" || myPhone != "0355505111"{
                wrongPassAndPhone.isHidden = false
            }
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        if textField == txtPhone {
            phone.isHidden = false
            txtPhone.attributedPlaceholder = NSAttributedString(string: "vd: 0355505111",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            txtLine2.layer.borderColor = UIColor.white.cgColor
            txtLine2.layer.borderWidth = 1.0
            wrongPhone.isHidden = true
        }
        if textField == txtPass {
            pass.isHidden = false
            txtPass.attributedPlaceholder = NSAttributedString(string: "6-20 ký tự",attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            txtPass.textColor = UIColor.gray
            txtLine.layer.borderColor = UIColor.white.cgColor
            txtLine.layer.borderWidth = 1.0
            wrongPass.isHidden = true
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
                txtPhone.attributedPlaceholder = NSAttributedString(string: "Số điện thoại",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
                wrongPhone.isHidden = true
                txtLine2.layer.borderColor = UIColor.gray.cgColor
                txtLine2.layer.borderWidth = 1.0
                phone.isHidden = true
            }else if txtPhone.text != ""
            {
                phone.isHidden = true
            }
            
        }
        if textField == txtPass {
            let currentText = textField.text!
            if currentText.count > 20 || currentText.count < 6{
                wrongPass.isHidden = false
                txtLine.layer.borderColor = UIColor.red.cgColor
                txtLine.layer.borderWidth = 1.0
            }
            if txtPass.text == "" {
                txtPass.attributedPlaceholder = NSAttributedString(string: "Mật khẩu",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
                wrongPass.isHidden = true
                txtLine.layer.borderColor = UIColor.gray.cgColor
                txtLine.layer.borderWidth = 1.0
                pass.isHidden = true
            }else if txtPass.text != ""{
                pass.isHidden = true
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
    
    
    @IBAction func editChanged(_ sender: Any) {
        if txtPhone.text!.count == 10 && txtPass.text!.count >= 6{
          btnLogin.isEnabled = true
            btnLogin.alpha = 1.0
            btnLogin.backgroundColor = UIColor.green
            btnLogin.setTitleColor(.white, for: .normal)
        } else {
          btnLogin.isEnabled = false
            btnLogin.alpha = 0.5
            btnLogin.backgroundColor = UIColor.lightGray
            btnLogin.setTitleColor(.white, for: .normal)
            
        }
    }
    let user = ["1","2","3","4","5"]
    let image: [UIImage] = [
        UIImage(named: "user1")!,
        UIImage(named: "user2")!,
        UIImage(named: "user3")!,
        UIImage(named: "user4")!,
        UIImage(named: "user5")!,
    ]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell

        cell.userNumber.text = user[indexPath.item]
        cell.userImage.image = image[indexPath.item]
        
        cell.userNumber.textColor = UIColor.white
  

        let rightButton = UIBarButtonItem(title: "Chỉnh sửa", style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = rightButton
        let attributes: [NSAttributedString.Key : Any] = [ .font: UIFont.boldSystemFont(ofSize: 16) ]
        rightButton.setTitleTextAttributes(attributes, for: .normal)
        
        navigationItem.title = "Những ai đang xem?"
 

        return cell
    }
}

    
