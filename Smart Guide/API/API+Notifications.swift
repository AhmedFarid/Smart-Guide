//
//  API+Notifications.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Notifications: NSObject {

    class func notifications (completion: @escaping (_ error: Error?,_ sparParts: [notifacations]?)-> Void) {
        
        
        let url = URLs.getNotifications
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,nil)
            return
        }
        
        guard let type = helper.getAPIToken().role else {
            completion(nil,nil)
            return
        }
        
        let parameters = [
            "user_token" : user_token,
            "type": type
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
                var products = [notifacations]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = notifacations.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
