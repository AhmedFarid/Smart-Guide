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
    
    class func getGuide (bus_id: String,completion: @escaping (_ error: Error?,_ sparParts: [superViserGuides]?,_ id: String?,_ name: String?)-> Void) {
        
        
        let url = URLs.getGuide
        
        guard let company_id = helper.getAPIToken().companyId else {
            completion(nil,nil,nil,nil)
            return
        }
        
        let parameters = [
            "lang" : "ar",
            "company_id": company_id,
            "bus_id":bus_id
            
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil,nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                print(json)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil,nil,nil)
                    return
                }
                print(dataArray)
                var products = [superViserGuides]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = superViserGuides.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,nil,nil)
                if let id = json["default"]["id"].string{
                    let name = json["default"]["name"].string
                
                completion(nil, products,id,name)
                }
            }
        }
    }
    
    class func getDriver (bus_id: String,completion: @escaping (_ error: Error?,_ sparParts: [superViserDriver]?,_ id: String?,_ name: String?)-> Void) {
        
        
        let url = URLs.getDriver
        guard let company_id = helper.getAPIToken().companyId else {
            completion(nil,nil,nil,nil)
            return
        }
        
        
        let parameters = [
            "lang" : "ar",
            "bus_id": bus_id,
            "company_id": company_id
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil,nil,nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil,nil,nil)
                    return
                }
                print(dataArray)
                var products = [superViserDriver]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = superViserDriver.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products,nil,nil)
                if let id = json["default"]["id"].string{
                    let name = json["default"]["name"].string
                    
                    completion(nil, products,id,name)
                }
            }
        }
    }
    
    class func getMember (completion: @escaping (_ error: Error?,_ sparParts: [superViserMember]?)-> Void) {
        
        
        let url = URLs.getPath
        
        guard let company_id = helper.getAPIToken().companyId else {
            completion(nil,nil)
            return
        }
        
        let parameters = [
            "lang" : "ar",
            "company_id": company_id
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
    
    class func getTrip (type: String,completion: @escaping (_ error: Error?,_ sparParts: [trips]?)-> Void) {
        
        let url = URLs.getTrip
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,nil)
            return
        }
        
        let parameters = [
            "lang" : "ar",
            "user_token": user_token,
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
    
    class func filterByStatus (urls: String,status: String,completion: @escaping (_ error: Error?,_ sparParts: [trips]?)-> Void) {
        
        let url = urls
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,nil)
            return
        }
        
        let parameters = [
            "lang" : "ar",
            "user_token": user_token,
            "status": status
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
        
        guard let company_id = helper.getAPIToken().companyId else {
            completion(nil,nil)
            return
        }
        
        let parameters = [
            "lang" : "ar",
            "company_id": company_id
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
    
    
    class func getCarrier (driver_id: String,completion: @escaping (_ error: Error?,_ id: String?,_ name: String?,_ status: Bool?)-> Void) {
        
        
        let url = URLs.getCarrier
        
        
        let parameters = [
            "lang" : "ar",
            "driver_id": driver_id
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil,nil,nil)
                print(error)
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let status = json["status"].bool {
                    print(status)
                    if status == true{
                        if let id = json["data"]["id"].string {
                            let name = json["data"]["name"].string
                            completion(nil,id,name,status)
                        }
                    }else {
                        let data = json["error"].string
                        print(data ?? "no")
                        completion(nil,data,nil,status)
                    }
                }
                
            }
        }
        
    }
    
    class func getPrice (carrier_id: String,path_id: String,completion: @escaping (_ error: Error?,_ data: String?,_ status: Bool?)-> Void) {
        
        
        let url = URLs.getPrice
        
        
        let parameters = [
            "lang" : "ar",
            "carrier_id": carrier_id,
            "path_id": path_id
        ]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil,false)
                print(error)
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let status = json["status"].bool {
                    print(status)
                    if status == true{
                        if let data = json["data"].string {
                            completion(nil,data,status)
                        }
                    }else {
                        let data = json["error"].string
                        print(data ?? "no")
                        completion(nil,data,status)
                    }
                }
                
            }
        }
        
    }
    
    class func addTrib(name_en: String, name_ar: String, guide_id: String, driver_id: String,bus_id: String, start_date: String, end_date: String, path_id: String,company_id: String, price: String,status: String,number_passenger: String,start_time: String,end_time: String,carrier_id: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.addTrip
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil,false)
            return
        }
        guard let company_id = helper.getAPIToken().companyId else {
            completion(nil,false, nil,false)
            return
        }
        
        print(url)
        let parameters = [
            "name_en": name_en,
            "name_ar": name_ar,
            "guide_id": guide_id,
            "driver_id": driver_id,
            "bus_id": bus_id,
            "path_id": path_id,
            "company_id": company_id,
            "user_token": user_token,
            "status": status,
            "price": price,
            "number_passenger": number_passenger,
            "start_date":start_date,
            "end_date": end_date,
            "start_time": start_time,
            "end_time": end_time,
            "carrier_id": carrier_id
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

    
    class func editTrip(trip_id: String,status: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.editTripStatus
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil,false)
            return
        }
        
        print(url)
        let parameters = [
            "trip_id": trip_id,
            "user_token": user_token,
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
    
    class func cancelTrrips(trip_id: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.CancelTripSupervisor
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil,false)
            return
        }
        
        print(url)
        let parameters = [
            "trip_id": trip_id,
            "user_token": user_token
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


    
    class func startTrip(trip_id: String,headings: String,message:String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.startTrip
        
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
    
    class func tripPause(trip_id: String,headings: String,message:String,status:String,completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.tripPause
        
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
    
    class func requestAnswer(type: String,requestId: Int,headings: String,message:String,completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.requestAnswer
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil,false)
            return
        }
        
        print(url)
        let parameters = [
            "requestId": requestId,
            "user_token": user_token,
            "headings": headings,
            "message": message,
            "type": type
            ] as [String : Any]
        
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
