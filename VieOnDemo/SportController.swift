//
//  SportController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 19/01/2022.
//

import Foundation
import UIKit


class SportController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var lblLine: UILabel!
    @IBOutlet weak var liveShowView: LiveShowViewController!
    var ModelSport: [SportModel] = []
    var ImageModel = [ImageSportModel]()
    var ImageInModel = [ImageInSportModel]()
    @IBOutlet weak var collectionview: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ModelSport.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "SportCollectionViewCell", for: indexPath) as! SportCollectionViewCell
        let name = ModelSport[indexPath.row].name
        let imageInAction = ImageInModel[indexPath.row].imageInAction
        cell.imageSport.image = UIImage(named: imageInAction ?? "")
        cell.lblSport.text = name ?? ""
        cell.lblLable.isHidden = true
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (ModelSport[indexPath.row].name! as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0, weight: .semibold)])
        
        return CGSize(width: size.width + 40, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if let cell = collectionView.cellForItem(at: indexPath) as? SportCollectionViewCell {
            let imageAction = ImageModel[indexPath.row].imageAction
            cell.imageSport.image = UIImage(named: imageAction ?? "")
            cell.lblLable.isHidden = false
            cell.lblSport.textColor = .white
            cell.lblSport.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SportCollectionViewCell {
            
            let imageInAction = ImageInModel[indexPath.row].imageInAction
            cell.imageSport.image = UIImage(named: imageInAction ?? "")
            cell.lblLable.isHidden = true
            cell.lblSport.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
            cell.lblSport.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 28
        }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 0.0
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.register(UINib.init(nibName: "SportCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SportCollectionViewCell")
        
        ModelSport.append(SportModel.init(name: "Premier League"))
        ModelSport.append(SportModel.init(name: "A-League"))
        ModelSport.append(SportModel.init(name: "Eredivise"))
        ModelSport.append(SportModel.init(name: "Bundesliga"))
        
        ImageModel.append(ImageSportModel.init(imageAction: "PL"))
        ImageModel.append(ImageSportModel.init(imageAction: "AL"))
        ImageModel.append(ImageSportModel.init(imageAction: "EL"))
        ImageModel.append(ImageSportModel.init(imageAction: "BL"))
        
        ImageInModel.append(ImageInSportModel.init(imageInAction: "InPL"))
        ImageInModel.append(ImageInSportModel.init(imageInAction: "InAL"))
        ImageInModel.append(ImageInSportModel.init(imageInAction: "InEL"))
        ImageInModel.append(ImageInSportModel.init(imageInAction: "InBL"))
        
        lblLine.backgroundColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 0.5)
    }
}
