//
//  BaseItem.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 01/12/2021.
//

import UIKit

class BaseItem: NSObject, NSCoding {
    
    init?(json: [String: Any]?) {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
    }

    func encode(with aCoder: NSCoder) {
        
    }
}
