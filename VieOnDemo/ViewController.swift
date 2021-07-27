//
//  ViewController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 20/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var iconClick = false
    let imageicon = UIImageView()
    
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .black
        background.image = UIImage(named: "background")
        
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
}
