//
//  ListModel.swift
//  WebAndCrafts
//
//  Created by eldhose mathai on 27/07/22.
//  Copyright © 2022 eldhose mathai. All rights reserved.
//

import Foundation

// MARK: - List
struct ListModel: Codable {
    let status: Bool?
    let homeData: [DataList]?
}

// MARK: - HomeDatum
struct DataList: Codable {
    let type: String?
    let values: [DataValues]?
}

// MARK: - Value
struct DataValues: Codable {
    let id: Int?
    let name: String?
    let imageURL, bannerURL: String?
    let image: String?
    let actualPrice, offerPrice: String?
    let offer: Int?
    let isExpress: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case bannerURL = "banner_url"
        case image
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case offer
        case isExpress = "is_express"
    }
}
