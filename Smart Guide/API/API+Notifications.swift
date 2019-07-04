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
    
    class func notifactionDetiles(trip_id: String,completion: @escaping (_ error: Error?, _ success: Bool, _ trip_name: String?, _ guide: String?, _ driver: String?, _ bus: String?, _ path_from: String?, _ path_to: String?, _ number_passenger: String?,_ start_date: String?, _ end_date: String?, _ statuss: String?)->Void) {
        
        let url = URLs.getTripDetails
        print(url)
        let parameters = [
            "trip_id": trip_id
        ]
        
        print(parameters)
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil,nil,nil,nil,nil,nil,nil,nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                
                if let trip_name = json["data"]["trip_name"].string {
                    let guide = json["data"]["guide"].string
                    let driver = json["data"]["driver"].string
                    let bus = json["data"]["bus"].string
                    let path_from = json["data"]["path_from"].string
                    let path_to = json["data"]["path_to"].string
                    let number_passenger = json["data"]["number_passenger"].string
                    let start_date = json["data"]["start_date"].string
                    let end_date = json["data"]["end_date"].string
                    let statuss = json["data"]["status"].string
                    completion(nil, true, trip_name,guide,driver,bus,path_from,path_to,number_passenger,start_date,end_date,statuss)
                }
            }
            
        }
    }
}

