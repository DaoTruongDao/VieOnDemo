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
    
    @IBOutlet weak var txtLine2: UITextField!
    
    @IBOutlet weak var txtLine: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    @IBOutlet weak var background: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
    
   
    
}
