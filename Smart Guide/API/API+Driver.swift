//
//  API+Driver.swift
//  Smart Guide
//
//  Created by Farido on 4/30/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Driver: NSObject {

    class func getDriverTrips (completion: @escaping (_ error: Error?,_ sparParts: [drivers]?)-> Void) {
        
        
        let url = URLs.getTripsDriver
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,nil)
            return
        }
        
        let parameters = [
            "user_token" : user_token,
            "lang": "ar"
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [drivers]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = drivers.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
}
