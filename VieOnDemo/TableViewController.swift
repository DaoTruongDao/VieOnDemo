//
//  TableViewController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 17/01/2022.
//

import Foundation
import UIKit
class ProfileModel{
    var brandName: String?
    var sectionModel: [String]?
    var image: [String]?
    init(brandName: String, sectionModel: [String], image: [String]) {
        self.brandName = brandName
        self.sectionModel = sectionModel
        self.image = image
    }
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return userProfile.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProfile[section].sectionModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.selectionStyle = .none
        cell.lblMail.isHidden = true
        
        if indexPath.section == 0 {
            cell.lblName.text = userProfile[indexPath.section].sectionModel?[indexPath.row]
            cell.lblMail.text = "daoprovip2014@gmail.com"
            cell.imageCell.image = UIImage(named: userProfile[indexPath.section].image?[indexPath.row] ?? "")
            cell.lblMail.isHidden = false
        }else{
            cell.lblName.text = userProfile[indexPath.section].sectionModel?[indexPath.row]
            cell.imageCell.image = UIImage(named: userProfile[indexPath.section].image?[indexPath.row] ?? "")
            cell.imageCell.tintColor = .white
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(userProfile[indexPath.section].sectionModel?[indexPath.row] ?? "")")
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.height-4, height: 2))
//
//        lbl.backgroundColor = .darkGray
//        return lbl
//    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 40)
        )
        lbl.backgroundColor = .darkGray
        return lbl
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    @IBOutlet weak var tableView: UITableView!
    
 
    var userProfile = [ProfileModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.register(UINib.init(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    
        
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Đào Trường Đạo"], image: ["user5"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Đang xem", "Danh Sách Của Tôi"], image: ["icons8-replay-50","icons8-heart-24"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Lịch Sử Giao Dịch"], image: ["icons8-trading-64"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Đăng Nhập SmartTV"], image: ["icons8-tv-24"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Cài Đặt Ứng Dụng"], image: ["icons8-setting-64"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Điều Khoản Sử Dụng", "Trung Tâm Hỗ Trợ","Góp Ý","Về Ứng dụng"], image: ["icons8-protect-24","apple","icons8-question-64","icons8-about-48"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Đăng Xuất"], image: ["icons8-log-out-32"]))

        
        tableView.reloadData()
        
    }
    
}
