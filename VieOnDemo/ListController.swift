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
import AVKit
import AVFoundation

class ListController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SenData, LoginDelegate{
    var loginModel: LoginModel?
    func loginDelegate(data: LoginModel) {
        self.loginModel = data
    }
    
    func messageData(data: String) {
        print("Success", data)
    }
    @IBOutlet weak var collectionview: UICollectionView!
    var viewMode = LoginViewModel.init()
    var tokenMode = TokenViewModel.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftButton = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = "Bộ Sưu tập LK"
        navigationController?.navigationBar.backgroundColor = UIColor.darkGray
        collectionview?.delegate = self
        collectionview?.dataSource = self
        viewMode.delegate = self
        //        tokenMode.delegate = self
        viewMode.listItem {
            self.lis = self.viewMode.listModel?.items ?? []
            self.collectionview?.reloadData()
            print(self.lis)
        }
    }
    var detailModel: DetailModel?
    var lis: [ItemModel] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lis.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
        viewMode.detailItem(complete: {
            self.detailModel = self.viewMode.detailModel
            vc.Title = self.detailModel?.title
            vc.LongDetail = self.detailModel?.shortDescription
            
            let url = URL(string: self.detailModel?.trailerLinhPlay?.hls_link_play ?? "")
            let player = AVPlayer(url: url!)
            let avpCon = AVPlayerViewController()
            vc.avpController = avpCon
            vc.avpController.player = player
            vc.avpController.player!.play()
            let tagModel = self.detailModel?.tags ?? []
            let tag = tagModel[1]
            vc.Detail1 = tag.name ?? ""
            vc.Detail2 = tag.type ?? ""
            vc.Detail3 = tag.slug ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
            vc.delegate = self
        }, id: lis[indexPath.row].id ?? "")
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
