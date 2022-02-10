//
//  ProfileTableViewCell.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 17/01/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    
    
    @IBOutlet weak var imageNext: UIImageView!
    
    
    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var lblName
        : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
