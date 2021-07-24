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
    
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .black
        background.image = UIImage(named: "background")


}
}
