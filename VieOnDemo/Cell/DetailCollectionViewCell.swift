//
//  DetailCollectionViewCell.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 14/01/2022.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var vip: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var new: UILabel!
    @IBOutlet weak var top10: UILabel!
    @IBOutlet weak var nation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
 
}


