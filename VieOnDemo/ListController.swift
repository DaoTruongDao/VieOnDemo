//
//  ListController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 16/12/2021.
//

import Foundation
import UIKit
import SwiftUI
import ObjectMapper
import Alamofire


class ListController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SenData, ListDelegate{
    func listData(data: ListModel){
        print(data)
    }
    
    func messageData(data: String) {
        print("Success", data)
    }

    @IBOutlet weak var collectionview: UICollectionView!
    var viewMode = LoginViewModel.init()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let leftButton = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = "Bộ Sưu tập LK"
        
        navigationController?.navigationBar.backgroundColor = UIColor.darkGray
        
//        viewMode.list {
//            self.lis = self.viewMode.lis?.items ?? []
//            self.collectionview?.reloadData()
//            print(self.lis)
//        }
//        viewMode.list()
        collectionview?.delegate = self
        collectionview?.dataSource = self
        
        
  
    }
    
    var lis: [ItemModel] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return lis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        collectionView.backgroundColor = UIColor.gray
        let listItem = self.lis[indexPath.row]
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.rank.isHidden = true
        cell.vip.isHidden = true
        cell.top10.isHidden = true
        
        cell.backgroundColor = UIColor.black
        if let imageURL = URL(string: listItem.images?.poster_v4 ?? "") {
            
                if let imageData = try? Data(contentsOf: imageURL){
                    cell.userImage.image = UIImage(data: imageData)
                }
            
        }
        let vip = lis[indexPath.item].is_premium_display
        if vip != "" {
            cell.vip.isHidden = false
        }else{
            cell.vip.text = "20000đ"
            cell.vip.isHidden = false
        }
        let rank = (lis[indexPath.item].ranking)!
        let new = (lis[indexPath.item].is_new)!
        if  (rank > 0 && new > 0) || rank > 0{
            cell.top10.isHidden = false
        }else if rank == 0 && new > 0{
            cell.rank.isHidden = false
        }
        var news: [String] = lis[indexPath.item].tags_display ?? []
        let stackview = cell.stackview
        news.append("mỗi tuần")
        
        
        let widh = cell.bounds.width-50
        if news.isEmpty{
            cell.new.isHidden = true
            cell.nation.isHidden = true
        } else if news.count > 1{
            cell.new.text = news[0]
            cell.nation.text = news[1]
            cell.nation.isHidden = false
            cell.new.isHidden = false
            if cell.new.intrinsicContentSize.width > widh{
                stackview?.axis = .vertical
            }
            else{
                stackview?.axis = .horizontal
            }
        }else{
            cell.new.text = news[0]
            cell.new.isHidden = false
            cell.nation.isHidden = true
        }
        
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailList") as! DetailList
        vc.labelText = lis[indexPath.row].id

        self.navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self
        
  
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 48)/3
        return CGSize(width: width, height: width*(156/109))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 16, bottom: 10, right: 8)
    }
  
  
    
}
