//
//  API+Notifatction.swift
//  Smart Guide
//
//  Created by Farido on 7/3/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Notifatction: NSObject {

    class func sendKayFireBase(firebaseToken: String ,completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?, _ status: Bool?)->Void) {
        
        let url = URLs.getFirebaseToken
        
        
        guard let user_token = helper.getAPIToken().userToken else {
            completion(nil,false, nil,false)
            return
        }
        
        guard let role = helper.getAPIToken().role else {
            completion(nil,false, nil,false)
            return
        }
        
        print(url)
        let parameters = [
            "user_token": user_token,
            "firebaseToken": firebaseToken,
            "deviceType": "ios",
            "role": role ,
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
