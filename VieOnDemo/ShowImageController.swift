//
//  ShowImageController.swift
//  VieOnDemo
//
//  Created by Đạo Trường on 11/02/2022.
//

import Foundation
import UIKit
import FSPagerView

class ShowImageController: UIViewController {
    @IBOutlet weak var pagerView: FSPagerView!{
        didSet{
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.transformer = FSPagerViewTransformer(type: .linear)
            self.pagerView.contentMode = .scaleAspectFit
            self.pagerView.automaticSlidingInterval = 2
            self.pagerView.isInfinite = true
            
            
        }
    }
    
    let imageModel = ["image1","image2","image3","image4","image5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        pagerView.delegate = self
        pagerView.dataSource = self
    }
}

extension ShowImageController: FSPagerViewDataSource,FSPagerViewDelegate{
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageModel.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageModel[index])
        cell.isHighlighted = false
        return cell
    }
    
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        //        pagerView.deselectItem(at: index, animated: true)
        //        pagerView.scrollToItem(at: index, animated: true)
        
        //        pagerView.backgroundColor = UIColor(patternImage: UIImage(named: self.imageModel[index])!)
        
    }
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        print("willDisplay index:", index)
        pagerView.backgroundView?.removeFromSuperview()
        let imageBackground : UIImageView!
        imageBackground = UIImageView(frame: pagerView.bounds)
        imageBackground.contentMode = .scaleAspectFill
        imageBackground.center = view.center
        if index == 0{
            imageBackground.image = UIImage(named: self.imageModel[4])
        }else if index != 0{
            imageBackground.image = UIImage(named: self.imageModel[index - 1])
        }
        
        pagerView.backgroundView = imageBackground
    }
    
    
    
    func pagerView(_ pagerView: FSPagerView, didEndDisplaying cell: FSPagerViewCell, forItemAt index: Int) {
        
        
    }
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
//        pagerView.backgroundView?.removeFromSuperview()
//        let imageBackground : UIImageView!
//        imageBackground = UIImageView(frame: pagerView.bounds)
//        imageBackground.contentMode = .scaleAspectFill
//        imageBackground.center = view.center
//        imageBackground.image = UIImage(named: self.imageModel[targetIndex])
//        pagerView.backgroundView = imageBackground
    }
    
    
}


