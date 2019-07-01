//
//  API+Members.swift
//  Smart Guide
//
//  Created by Farido on 6/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Members: NSObject {

    class func getSuperVisor (completion: @escaping (_ error: Error?,_ sparParts: [superVisorss]?)-> Void) {
        
        
        let url = URLs.getSupervisors
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
                var products = [superVisorss]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = superVisorss.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func getTripsMemebrt (supervisor_id: String,completion: @escaping (_ error: Error?,_ sparParts: [trips]?)-> Void) {
        
        let url = URLs.getTripsMemberSupervisor
        
//        guard let user_token = helper.getAPIToken().userToken else {
//            completion(nil,nil)
//            return
//        }
//
        let parameters = [
            "lang" : "ar",
            "supervisor_id": supervisor_id
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
                var products = [trips]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = trips.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func tripEndMember(trip_id: String,headings: String,message:String,status:String,completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.endTripMember
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil,false)
            return
        }
        
        print(url)
        let parameters = [
            "trip_id": trip_id,
            "user_token": user_token,
            "headings": headings,
            "message": message,
            "status": status
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil,false)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let status = json["status"].bool {
                    print(status)
                    if status == true{
                        if let data = json["data"].string {
                            print(data)
                            completion(nil, true, data,status)
                        }
                    }else {
                        let data = json["error"].string
                        print(data ?? "no")
                        completion(nil, true, data,status)
                    }
                }
                
            }
        }
        
    }
    
}
