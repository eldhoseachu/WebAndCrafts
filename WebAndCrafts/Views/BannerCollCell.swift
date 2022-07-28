//
//  BannerCollCell.swift
//  WebAndCrafts
//
//  Created by eldhose mathai on 27/07/22.
//  Copyright © 2022 eldhose mathai. All rights reserved.
//

import UIKit

class BannerCollCell: UICollectionViewCell {
    
    @IBOutlet weak var imgBanner: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgBanner.layer.cornerRadius = 6
    }

    func configCell(bannerData: DataValues) {
        if let url = URL(string: bannerData.bannerURL ?? "") {
            ApiHandler.shared().downloadImage(from: url) { (imgData, urlRes, error) in
                if let imgData = imgData {
                    DispatchQueue.main.async {
                        self.imgBanner.image = UIImage(data: imgData)
                    }
                }
                else {
                    self.imgBanner.image = UIImage(named: "profile")!
                }
            }
        }
        else {
            imgBanner.image = UIImage(named: "profile")!
        }
    }
}
