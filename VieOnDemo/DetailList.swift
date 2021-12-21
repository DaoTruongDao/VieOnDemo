//
//  DetailList.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 21/12/2021.
//

import Foundation
import UIKit
import SwiftUI
import ObjectMapper
import Alamofire

protocol SenData{
    func messageData(data: String)
}
class DetailList: UIViewController{
    
    @IBOutlet weak var hinhAnh: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    var delegate: SenData?
    var labelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
        
    }
    
    @IBAction func clickButton(_ sender: Any) {
        if self.labelText != nil {
            if let dataItem = self.labelText{
                self.delegate?.messageData(data: dataItem)
            }
        }
    } 
}
