//
//  API-SuperVisour.swift
//  Smart Guide
//
//  Created by farid on 3/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_SuperVisour: NSObject {
    
    class func getGuide (completion: @escaping (_ error: Error?,_ sparParts: [superViserGuides]?)-> Void) {
        
        
        let url = URLs.getGuide
        
        let parameters = [
            "lang" : "ar"
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
                var products = [superViserGuides]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = superViserGuides.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func getDriver (completion: @escaping (_ error: Error?,_ sparParts: [superViserDriver]?)-> Void) {
        
        
        let url = URLs.getDriver
        
        let parameters = [
            "lang" : "ar"
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
                var products = [superViserDriver]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = superViserDriver.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func getMember (completion: @escaping (_ error: Error?,_ sparParts: [superViserMember]?)-> Void) {
        
        
        let url = URLs.getMember
        
        let parameters = [
            "lang" : "ar"
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
                var products = [superViserMember]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = superViserMember.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func getTrip (completion: @escaping (_ error: Error?,_ sparParts: [trips]?)-> Void) {
        
        let url = URLs.getTrip
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,nil)
            return
        }
        
        let parameters = [
            "lang" : "ar",
            "user_token": user_token,
            "type": "1"
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
    
    class func getBus (completion: @escaping (_ error: Error?,_ sparParts: [superViserBus]?)-> Void) {
        
        
        let url = URLs.getBus
        
        let parameters = [
            "lang" : "ar"
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
                var products = [superViserBus]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = superViserBus.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func addTrib(name_en: String, name_ar: String, guide_id: String, member_id: String,driver_id: String, bus_id: String, from: String, to: String,date_time_start: String, date_time_end: String,start_lat: String,start_lng: String,end_lat: String,end_lng: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLs.addTrip
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil)
            return
        }
        guard let company_id = helper.getAPIToken().companyId else {
            completion(nil,false, nil)
            return
        }
        
        print(url)
        let parameters = [
            "name_en": name_en,
            "name_ar": name_ar,
            "guide_id": guide_id,
            "member_id": member_id,
            "driver_id": driver_id,
            "bus_id": bus_id,
            "from": from,
            "to": to,
            "date_time_start": date_time_start,
            "date_time_end": date_time_end,
            "start_lat": start_lat,
            "start_lng": start_lng,
            "end_lat": end_lat,
            "end_lng": end_lng,
            "company_id": company_id,
            "user_token": user_token
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["data"]["userToken"].string {
                    print("user token \(user_token)")
                    //helper.saveAPIToken(token: user_token)
                    completion(nil, true , nil)
                }else if let data = json["data"].string {
                    print(data)
                    completion(nil, true, data)
                }else  {
                    let data = json["error"].string
                    print(data ?? "no")
                    completion(nil, true, data)
                }
                
            }
        }
        
    }

}
