//
//  GroceryList+Extension.swift
//  WebAndCrafts
//
//  Created by eldhose mathai on 27/07/22.
//  Copyright © 2022 eldhose mathai. All rights reserved.
//

import Foundation
import UIKit

extension GroceryListVC: UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionCategory {
            return categoryList.count
        }
        if collectionView == collectionBanners {
            return bannerList.count
        }
        if collectionView == collectionProducts {
            return productList.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionCategory {
            return CGSize(width: 80, height: 120)
        }
        if collectionView == collectionBanners {
            return CGSize(width: collectionView.frame.width - 40, height: 180)
        }
        if collectionView == collectionProducts {
            return CGSize(width: collectionView.frame.width / 2 - 20, height: 300)
        }
        return CGSize(width: 80, height: 100)
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionCategory {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCellIdentifiers.kCategoryCollCell, for: indexPath) as? CategoryCollCell {
                
                cell.configCell(catData: categoryList[indexPath.row])
                
                return cell
            }
            
            return UICollectionViewCell()
        }
        if collectionView == collectionBanners {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCellIdentifiers.kBannerCollCell, for: indexPath) as? BannerCollCell {
                
                cell.configCell(bannerData: bannerList[indexPath.row])
                
                return cell
            }
            
            return UICollectionViewCell()
        }
        if collectionView == collectionProducts {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCellIdentifiers.kProductCollCell, for: indexPath) as? ProductCollCell {
                
                cell.configCell(prodData: productList[indexPath.row])
                
                return cell
            }
            
            return UICollectionViewCell()
        }
        
        return UICollectionViewCell()
    }
}
