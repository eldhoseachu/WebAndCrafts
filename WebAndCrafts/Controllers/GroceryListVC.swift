//
//  GroceryListVC.swift
//  WebAndCrafts
//
//  Created by eldhose mathai on 27/07/22.
//  Copyright © 2022 eldhose mathai. All rights reserved.
//

import UIKit

class GroceryListVC: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var listSearchBar: UISearchBar!
    
    @IBOutlet weak var collectionCategory: UICollectionView!
    @IBOutlet weak var collectionBanners: UICollectionView!
    @IBOutlet weak var collectionProducts: UICollectionView!
    
    //MARK:- variables
    
    
    //MARK:- Overrided functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    //MARK:- Userdefined functions
    func configUI() {
        
        let imageBar = self.getImageWithColor(color: UIColor.gray, size: CGSize(width: self.view.frame.width, height: 45))
        listSearchBar.setSearchFieldBackgroundImage(imageBar, for: .normal)
        self.listSearchBar.backgroundImage = UIImage()
    }
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 5.0)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        path.fill()
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
