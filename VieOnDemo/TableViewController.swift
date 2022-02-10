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

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
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
        cell.lblLabel.isHidden = true
        cell.backgroundColor = UIColor(red: 0.898/255.0, green: 0.898/255.0, blue: 0.898/255.0, alpha: 1)
        let cellImage = userProfile[indexPath.section].image?[indexPath.row]
        let cellName = userProfile[indexPath.section].sectionModel?[indexPath.row]
        if indexPath.section == 0 {
            cell.lblName.text = userProfile[indexPath.section].sectionModel?[indexPath.row]
            cell.lblMail.text = "daoprovip2014@gmail.com"
            cell.imageCell.image = UIImage(named: cellImage ?? "")
            cell.lblMail.isHidden = false
            cell.lblLabel.isHidden = false
        }else{
            cell.lblName.text = userProfile[indexPath.section].sectionModel?[indexPath.row]
            cell.imageCell.image = UIImage(named: cellImage ?? "")
            cell.imageCell.tintColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)
//            cell.imageCell.tintColor = .white
        }
        
        if cellName == "Đăng Xuất" {
            cell.imageNext.isHidden = true
        }
        if cellName == "Danh Sách Của Tôi" ||  cellName == "Lịch Sử Giao Dịch"  || cellName == "Đăng Nhập SmartTV" || cellName == "Cài Đặt Ứng Dụng" || cellName ==  "Về Ứng dụng"{
            cell.lblLabel.isHidden = false
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Sport") as! SportController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var userProfile = [ProfileModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(red: 0.898/255.0, green: 0.898/255.0, blue: 0.898/255.0, alpha: 1)
        self.view.layer.backgroundColor = UIColor(red: 0.898/255.0, green: 0.898/255.0, blue: 0.898/255.0, alpha: 1).cgColor
        navigationItem.title = "Cá Nhân"
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        tableView.register(UINib.init(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell") 
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Đào Trường Đạo"], image: ["user5"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Đang xem", "Danh Sách Của Tôi"], image: ["rewatch","favorite"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Lịch Sử Giao Dịch"], image: ["card"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Đăng Nhập SmartTV"], image: ["tv"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Cài Đặt Ứng Dụng"], image: ["setting"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Điều Khoản Sử Dụng", "Trung Tâm Hỗ Trợ","Góp Ý","Về Ứng dụng"], image: ["shield","group","help","infor"]))
        userProfile.append(ProfileModel.init(brandName: "", sectionModel: ["Đăng Xuất"], image: ["logout"]))
        
        tableView.reloadData()
    }
}
