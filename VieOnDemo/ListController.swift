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


class ListController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    @IBOutlet weak var collectionview: UICollectionView!
    var viewMode = LoginViewModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.title = "Bộ Sưu tập LK"
        
        navigationController?.navigationBar.backgroundColor = UIColor.darkGray
        
        viewMode.list {
            self.lis = self.viewMode.lis?.items ?? []
            self.collectionview.reloadData()
            print(self.lis)
        }
        collectionview.delegate = self
        collectionview.dataSource = self
        
        
    }
    
    var lis: [ItemModel] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return lis.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        collectionView.backgroundColor = UIColor.gray
        let listItem = self.lis[indexPath.row]
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell

        if let imageURL = URL(string: listItem.images?.thumbnail_hot_v4 ?? "") {
            if let imageData = try? Data(contentsOf: imageURL) {
                if let imageData = try? Data(contentsOf: imageURL){
                    cell.userImage.image = UIImage(data: imageData)
                }
            }
        }
        cell.backgroundColor = UIColor.gray
        return cell
        
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
