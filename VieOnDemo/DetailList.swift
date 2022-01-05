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
    
    var delegate: SenData?
    var labelText: String?
    var image: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
        hinhAnh.image = image
    }
    
}
