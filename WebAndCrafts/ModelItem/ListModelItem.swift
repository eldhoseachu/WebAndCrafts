//
//  ListModelItem.swift
//  WebAndCrafts
//
//  Created by eldhose mathai on 27/07/22.
//  Copyright © 2022 eldhose mathai. All rights reserved.
//

import Foundation

protocol HomeListingAPIDelegate: class {
    func didReceiveHomeList(error: Bool?, message: String?, listModel: ListModel?)
}

// MARK: - List
class ListModelItem {
    weak var delegate: HomeListingAPIDelegate?
    
    func getHomeListAPI() {
        let url = "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
        ApiHandler.shared().callAPI(callURl: url) { (resString, error, errorMsg) in
     
            if error == false {
                
                if let apiResponseModel = ApiHandler.shared().decode(ListModel.self, from: resString ?? ""){
                    
                    self.delegate?.didReceiveHomeList(error: false, message: nil, listModel: apiResponseModel)
                }else{
                    self.delegate?.didReceiveHomeList(error: true, message: nil, listModel:nil)
                }
            }
            else {
                self.delegate?.didReceiveHomeList(error: true, message: nil, listModel:nil)
            }
        }
    }
}
