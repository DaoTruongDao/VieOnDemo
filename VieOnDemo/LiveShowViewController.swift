//
//  LiveShowViewController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 11/02/2022.
//

import Foundation
import UIKit


class LiveShowViewController: UIView {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.register(UINib.init(nibName: "LiveShowCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LiveShowCollectionViewCell")
        collectionView.register(LiveShowCollectionViewCell.self, forCellWithReuseIdentifier: "LiveShowCollectionViewCell")
//        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        addSubview(collectionView)
//        collectionView.edgesToSuperview()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}
let imageModel = ["image1","image2","image3","image4","image5"]
extension LiveShowViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveShowCollectionViewCell", for: indexPath) as! LiveShowCollectionViewCell
        cell.imageLiveShow.image = UIImage(named: imageModel[indexPath.row] )
        return cell
        
    }

}

extension LiveShowViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 28
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: 370)
    }
}
