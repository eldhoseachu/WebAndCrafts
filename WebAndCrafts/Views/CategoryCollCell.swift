//
//  CategoryCollCell.swift
//  WebAndCrafts
//
//  Created by eldhose mathai on 27/07/22.
//  Copyright © 2022 eldhose mathai. All rights reserved.
//

import UIKit

class CategoryCollCell: UICollectionViewCell {
    
    @IBOutlet weak var vwImage: UIView!
    

    @IBOutlet weak var imgCategory: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        vwImage.layer.cornerRadius = 35
    }

    func configCell(catData: DataValues) {
        lblName.text = catData.name ?? ""
        
        if let url = URL(string: catData.imageURL ?? "") {
            ApiHandler.shared().downloadImage(from: url) { (imgData, urlRes, error) in
                if let imgData = imgData {
                    DispatchQueue.main.async {
                        self.imgCategory.image = UIImage(data: imgData)
                    }
                }
                else {
                    self.imgCategory.image = UIImage(named: "profile")!
                }
            }
        }
        else {
            imgCategory.image = UIImage(named: "profile")!
        }
    }
}
