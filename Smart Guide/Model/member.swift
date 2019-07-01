//
//  member.swift
//  Smart Guide
//
//  Created by Farido on 6/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import SwiftyJSON

class member: NSObject {

}

class superVisorss: NSObject {
    
    var id: Int?
    var name: String?
    
    
    init?(dict: [String: JSON]){
        let id = dict["id"]?.int
        let name = dict["name"]?.string
        
        self.id = id
        self.name = name
    }
}
