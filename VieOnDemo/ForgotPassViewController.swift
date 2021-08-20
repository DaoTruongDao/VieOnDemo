//
//  ForgotPassViewController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 20/08/2021.
//

import UIKit
import Firebase


class ForgotPassViewController: UIViewController {

    @IBOutlet weak var phone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func conTinue(_ sender: Any) {
        self.performSegue(withIdentifier: "singInedSeque", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
