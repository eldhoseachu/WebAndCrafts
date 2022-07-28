//
//  GroceryListVC.swift
//  WebAndCrafts
//
//  Created by eldhose mathai on 27/07/22.
//  Copyright © 2022 eldhose mathai. All rights reserved.
//

import UIKit

class GroceryListVC: UIViewController, UISearchBarDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var listSearchBar: UISearchBar!
    
    @IBOutlet weak var collectionCategory: UICollectionView!
    @IBOutlet weak var collectionBanners: UICollectionView!
    @IBOutlet weak var collectionProducts: UICollectionView!
    
    //MARK:- variables
    
    var categoryList = [DataValues]()
    var bannerList = [DataValues]()
    var productList = [DataValues]()
    let listModelItem = ListModelItem()
    
    //MARK:- Overrided functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configClxnview()
        
        listModelItem.delegate = self
        listModelItem.getHomeListAPI()
        
        // Do any additional setup after loading the view.
        
    }
    
    //MARK:- Userdefined functions
    func configClxnview() {
        collectionCategory.register(UINib(nibName: CollectionCellIdentifiers.kCategoryCollCell, bundle: nil), forCellWithReuseIdentifier: CollectionCellIdentifiers.kCategoryCollCell)
        collectionCategory.delegate = self
        collectionCategory.dataSource = self
        collectionCategory.reloadData()
        
        collectionBanners.register(UINib(nibName: CollectionCellIdentifiers.kBannerCollCell, bundle: nil), forCellWithReuseIdentifier: CollectionCellIdentifiers.kBannerCollCell)
        collectionBanners.delegate = self
        collectionBanners.dataSource = self
        collectionBanners.reloadData()
        
        collectionProducts.register(UINib(nibName: CollectionCellIdentifiers.kProductCollCell, bundle: nil), forCellWithReuseIdentifier: CollectionCellIdentifiers.kProductCollCell)
        collectionProducts.delegate = self
        collectionProducts.dataSource = self
        collectionProducts.reloadData()
    }
    
    func configUI() {
        
        let imageBar = self.getImageWithColor(color: UIColor.gray.withAlphaComponent(0.1), size: CGSize(width: self.view.frame.width, height: 50))
    
        listSearchBar.setSearchFieldBackgroundImage(imageBar, for: .normal)
        self.listSearchBar.backgroundImage = UIImage()
        
        self.listSearchBar.delegate = self
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}

// MARK: - HomeListingAPIDelegate
extension GroceryListVC: HomeListingAPIDelegate {
    func didReceiveHomeList(error: Bool?, message: String?, listModel: ListModel?) {
        if let listModel = listModel {
            let homeList = listModel.homeData

            if let home = listModel.homeData {
                categoryList = home.first(where: {$0.type == "category"})?.values ?? []
    
                bannerList = home.first(where: {$0.type == "banners"})?.values ?? []
          
                productList = home.first(where: {$0.type == "products"})?.values ?? []
   
                collectionCategory.reloadData()
                collectionBanners.reloadData()
                collectionProducts.reloadData()
            }
        }
    }
}
