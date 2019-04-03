//
//  helper.swift
//  Smart Guide
//
//  Created by farid on 3/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import Foundation


import UIKit

class helper: NSObject {
    class func restartApp(){
        guard let window = UIApplication.shared.keyWindow else {return}
        
        var vc: UIViewController
        if getAPIToken().userToken == nil {
            let sb = UIStoryboard(name: "auth", bundle: nil)
            vc = sb.instantiateInitialViewController()!
        }else if getAPIToken().role == "supervisor" {
            let sb = UIStoryboard(name: "supervisor", bundle: nil)
            vc = sb.instantiateInitialViewController()!
        }else if getAPIToken().role == "driver" {
            let sb = UIStoryboard(name: "driver", bundle: nil)
            vc = sb.instantiateInitialViewController()!
        }else if getAPIToken().role == "guide" {
            let sb = UIStoryboard(name: "guide", bundle: nil)
            vc = sb.instantiateInitialViewController()!
        }else {
            let sb = UIStoryboard(name: "member", bundle: nil)
            vc = sb.instantiateInitialViewController()!
        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    class func dleteAPIToken() {
        let def = UserDefaults.standard
        def.removeObject(forKey: "userToken")
        def.removeObject(forKey: "name")
        def.removeObject(forKey: "role")
        def.removeObject(forKey: "phone")
        def.removeObject(forKey: "address")
        def.removeObject(forKey: "image")
        def.removeObject(forKey: "companyId")
        def.removeObject(forKey: "ssn")
        def.removeObject(forKey: "nationality")
        def.synchronize()
        
        restartApp()
    }
    
    class func saveAPIToken(userToken: String,name: String,role: String, phone: String, address: String, image: String, companyId: String, ssn: String, nationality: String) {
        let def = UserDefaults.standard
        def.setValue(userToken, forKey: "userToken")
        def.setValue(name, forKey: "name")
        def.setValue(role, forKey: "role")
        def.setValue(phone, forKey: "phone")
        def.setValue(address, forKey: "address")
        def.setValue(image, forKey: "image")
        def.setValue(companyId, forKey: "companyId")
        def.setValue(ssn, forKey: "ssn")
        def.setValue(nationality, forKey: "nationality")
        
        def.synchronize()
        
        restartApp()
    }
    
    class func getAPIToken() -> (userToken: String?,name: String?, role: String?, phone: String?, address: String?, image: String?, companyId: String?, ssn: String?, nationality: String?) {
        let def = UserDefaults.standard
        return (def.object(forKey: "userToken") as? String,def.object(forKey: "name") as? String,def.object(forKey: "role") as? String,def.object(forKey: "phone") as? String,def.object(forKey: "address") as? String,def.object(forKey: "image") as? String,def.object(forKey: "companyId") as? String,def.object(forKey: "ssn") as? String,def.object(forKey: "nationality") as? String)
    }
}
