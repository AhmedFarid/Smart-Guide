//
//  API - Auth.swift
//  Smart Guide
//
//  Created by farid on 3/26/19.
//  Copyright © 2019 farid. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class API_AUTH: NSObject {
    
    class func login(email: String,password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLs.login
        print(url)
        let parameters = [
            "lang": "ar",
            "email": email,
            "password": password
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
                //family_member
                
//                if let userToken = json["data"]["userToken"].string, let name = json["data"]["name"].string, let role = json["data"]["role"].string, let phone = json["data"]["phone"].string,let image = json["data"]["image"].string,let companyId = json["data"]["companyId"].string, let ssn = json["data"]["ssn"].string,let nationality = json["data"]["nationality"].string,let address = json["data"]["address"].string
                
                if let userToken = json["data"]["userToken"].string, let name = json["data"]["name"].string, let role = json["data"]["role"].string,let image = json["data"]["image"].string,let companyId = json["data"]["companyId"].string, let ssn = json["data"]["ssn"].string,let nationality = json["data"]["nationality"].string  {
                    print("user token \(userToken)")
                    helper.saveAPIToken(userToken: userToken, name: name, role: role, phone: "phone", address: "address", image: image, companyId: companyId, ssn: ssn, nationality: nationality)
                    completion(nil, true , nil)
                    
                    //parent
                }
                
            }
        }
        
    }
}
