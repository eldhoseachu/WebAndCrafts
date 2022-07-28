//
//  ProductCollCell.swift
//  WebAndCrafts
//
//  Created by eldhose mathai on 27/07/22.
//  Copyright © 2022 eldhose mathai. All rights reserved.
//

import UIKit

class ProductCollCell: UICollectionViewCell {
    @IBOutlet weak var vwMain: UIView!
    
    @IBOutlet weak var imgProd: UIImageView!
    
    @IBOutlet weak var imgTruck: UIImageView!
    
    @IBOutlet weak var lblActualPrice: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var lblOffer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        vwMain.layer.cornerRadius = 3
        vwMain.layer.borderWidth = 1
        vwMain.layer.borderColor = UIColor.lightGray.cgColor
        
        btnAdd.layer.cornerRadius = 3
        imgTruck.layer.cornerRadius = 3
        
        lblOffer.clipsToBounds = true
        lblOffer.layer.cornerRadius = 2
        lblOffer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

    func configCell(prodData: DataValues) {
        lblName.text = prodData.name ?? ""
        lblOffer.text = "\(prodData.offer ?? 0)% OFF"
        
        lblActualPrice.attributedText = (prodData.actualPrice ?? "").strikethrough
        lblOfferPrice.text = prodData.offerPrice ?? ""
        
        if prodData.isExpress == true {
            imgTruck.isHidden = false
        }
        else {
            imgTruck.isHidden = true
        }
        
        if (prodData.offer ?? 0) > 0 { lblOffer.isHidden = false
        } else {
            lblOffer.isHidden = true
        }
        
        if prodData.actualPrice == prodData.offerPrice {
            lblActualPrice.isHidden = true
        }
        else {
            lblActualPrice.isHidden = false
        }
        if let url = URL(string: prodData.image ?? "") {
            ApiHandler.shared().downloadImage(from: url) { (imgData, urlRes, error) in
                if let imgData = imgData {
                    DispatchQueue.main.async {
                        self.imgProd.image = UIImage(data: imgData)
                    }
                }
                else {
                    self.imgProd.image = UIImage(named: "profile")!
                }
            }
        }
        else {
            imgProd.image = UIImage(named: "profile")!
        }
    }
}
