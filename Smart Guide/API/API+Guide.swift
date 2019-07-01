//
//  API+Guide.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Guide: NSObject {
    
    class func getTrip (completion: @escaping (_ error: Error?,_ sparParts: [guidesTrips]?)-> Void) {
        
        let url = URLs.getTripsGuide
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,nil)
            return
        }
        
        let parameters = [
            "lang" : "ar",
            "user_token": user_token,
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
                var products = [guidesTrips]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = guidesTrips.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    class func tripPause(trip_id: String,headings: String,message:String,completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.requestPauseTrip
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil,false)
            return
        }
        
        print(url)
        let parameters = [
            "trip_id": trip_id,
            "user_token": user_token,
            "headings": headings,
            "message": message
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

    class func endTrip(trip_id: String,headings: String,message:String,completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.endTripGuide
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil,false)
            return
        }
        
        print(url)
        let parameters = [
            "trip_id": trip_id,
            "user_token": user_token,
            "headings": headings,
            "message": message
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
    
    
    class func getRequestPauseTrip (urls:String,completion: @escaping (_ error: Error?,_ sparParts: [getRequestPauseTrips]?)-> Void) {
        
        let url = urls
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,nil)
            return
        }
        
        let parameters = [
            "lang" : "ar",
            "user_token": user_token,
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
                var products = [getRequestPauseTrips]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = getRequestPauseTrips.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func startTripGuide(trip_id: String,headings: String,message:String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.startTripGuide
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil,false)
            return
        }
        
        print(url)
        let parameters = [
            "trip_id": trip_id,
            "user_token": user_token,
            "headings": headings,
            "message": message
            
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
