//
//  ViewController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 20/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let phoneImage = UIImage(named: "phone")
        addLeftImage(txtField: txtPhone, andImage: phoneImage!)
        
        let passImage = UIImage(named: "key")
        addLeftImage(txtField: txtPass, andImage: passImage!)
    }
    func addLeftImage(txtField: UITextField, andImage img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
}
    


