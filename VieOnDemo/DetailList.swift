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
import AVFoundation
import AVKit


protocol SenData{
    func messageData(data: String)
}

class DetailList: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var clipView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var lblDetail1: UILabel!
    
    @IBOutlet weak var lblDetail2: UILabel!
    
    @IBOutlet weak var lblDetail3: UILabel!
    
    @IBOutlet weak var lblLongDetail: UILabel!
    
    @IBOutlet weak var btnNews: UIButton!
    
    @IBOutlet weak var btnComment: UIButton!
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    var delegate: SenData?
    var Title: String?
    var Detail1: String?
    var Detail2: String?
    var Detail3: String?
    var LongDetail: String?
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    var viewMode = LoginViewModel.init()
    var lis: [ItemModel] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBAction func btnNews(_ sender: Any) {
        btnComment.tintColor = .darkGray
        btnNews.tintColor = .white
    }
    @IBAction func btnComment(_ sender: Any) {
        btnNews.tintColor = .darkGray
        btnComment.tintColor = .white
    }
    @IBAction func btnPlay(_ sender: Any) {
        
    }
    @IBAction func btnAdd(_ sender: Any) {
        if btnAdd.tintColor == .white {
            if let image = UIImage(named: "Vector-2") {
                btnAdd.setImage(image, for: .normal)
            }
            btnAdd.tintColor = .green
            btnAdd.setTitleColor(UIColor.green, for: .normal)
        }else{
            if let image = UIImage(named: "Vector") {
                btnAdd.setImage(image, for: .normal)
            }
            btnAdd.tintColor = .white
            btnAdd.setTitleColor(UIColor.white, for: .normal)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "DetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailCollectionViewCell")
        viewMode.listItem {
            self.lis = self.viewMode.listModel?.items ?? []
            self.collectionView?.reloadData()
            print(self.lis)
        }
        collectionView.backgroundColor = .black
        lbTitle.text = Title
        lblDetail1.text = Detail1
        lblDetail2.text = Detail2
        lblDetail3.text = Detail3
        lblLongDetail.text = LongDetail
        avpController.showsPlaybackControls = true
        avpController.videoGravity = .resizeAspectFill
        avpController.view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: clipView.frame.size.width, height: clipView.frame.size.height)
        clipView.addSubview(avpController.view)
        
        btnNews.setTitle("Thông Tin", for: .normal)
        btnNews.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .heavy)
        btnNews.tintColor = .white
        btnNews.titleLabel?.textAlignment = NSTextAlignment.center
        
        btnComment.setTitle("Bình Luận", for: .normal)
        btnComment.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .heavy)
        btnComment.tintColor = .darkGray
        btnComment.titleLabel?.textAlignment = NSTextAlignment.center
        
        btnPlay.backgroundColor = .white
        btnPlay.setTitle("Xem Ngay", for: .normal)
        btnPlay.layer.cornerRadius = 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lis.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let listItem = self.lis[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return CGSize(width: 109, height: 156)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}

