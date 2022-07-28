//
//  Constants.swift
//  WebAndCrafts
//
//  Created by eldhose mathai on 27/07/22.
//  Copyright © 2022 eldhose mathai. All rights reserved.
//

import Foundation
import UIKit

class CollectionCellIdentifiers {
    static let kCategoryCollCell    = "CategoryCollCell"
    static let kBannerCollCell      = "BannerCollCell"
    static let kProductCollCell     = "ProductCollCell"
}

extension String {
    var strikethrough: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])

    }
}
