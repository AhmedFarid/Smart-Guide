//
//  superVisers.swift
//  Smart Guide
//
//  Created by farid on 3/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import SwiftyJSON

class superVisers: NSObject {

}

class superViserGuides: NSObject {
    
    var id: String
    var name: String

    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.string,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
    }
    
    //"id": "1",
    //"name": "waaaa",
    //"email": "wel@gmail.com",
    //"phone": "01096981025",
    //"mobile": "01096981024",
    //"address": "Unnamed Road, Al Fayoum, Faiyum Governorate, Egypt",
    //"ssn": "852",
    //"nationality": "مصرى",
    //"image": "public/upload/guide/Wvnh2Ns4Q4n9dgx7GAnZafsy4TlHIM6WK0CJeFfq.jpeg",
    //"birthday": "02-02-1993",
    //"user_token": "6CcKjj5XgRWpiy8w7JyILQuhJytquC0CgYgdcx2WB0V0mOX1xJmnziLOzvZd",
    //"company_id": "1",
    //"userTokenCompany": "RmS7NCsmRzrkorq8iOgOLl22Zx5uFykGkLl40X9wyGV3KqJUqKM5Hb9OgXPk"

    
}

class superViserDriver: NSObject {
    
    var id: String
    var name: String
    
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.string,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
    }
//    
//    "id": "1",
//    "name": "Khaled mahmoud",
//    "email": "kh1@gmail.com",
//    "phone": "",
//    "mobile": "",
//    "address": "",
//    "ssn": "544",
//    "nationality": "مصرى",
//    "image": "public/upload/driver/vxkeTMOkVU1GE06zY3IMCVlXLCN1PWEjD5Ry2hvf.png",
//    "birthday": "05-12-1990",
//    "user_token": "h3pXyyuH2MmX56T1Rpb3I0gG0ZEygVz83nsKVJ3niWl1BW8Y4iGvxc4rlHil",
//    "company_id": "1",
//    "userTokenCompany": "RmS7NCsmRzrkorq8iOgOLl22Zx5uFykGkLl40X9wyGV3KqJUqKM5Hb9OgXPk"
    
    
}


class superViserMember: NSObject {
    
    var id: String
    var name: String
    
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.string,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
    }
//    
//    "id": "1",
//    "name": "Mahmoud ahmed",
//    "email": "mo@gmail.com",
//    "phone": "",
//    "mobile": "",
//    "address": "",
//    "ssn": "202",
//    "nationality": "مصرى",
//    "image": "public/upload/member/v1bJjRg7M6IznywN3qJDY3ZPQyTWBudxZQb5CRPH.png",
//    "birthday": "08-03-1948",
//    "user_token": "opub3NrswyNVJHVv0zzjVBY51SZ9q0ZO5rqAqQwCkz2rT5zvR5RhBPbBUUVe",
//    "company_id": "1",
//    "userTokenCompany": "RmS7NCsmRzrkorq8iOgOLl22Zx5uFykGkLl40X9wyGV3KqJUqKM5Hb9OgXPk"
    
}


class superViserBus: NSObject {
    
    var id: String
    var name: String
    
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.string,let name = dict["name"]?.string else {return nil}
        self.id = id
        self.name = name
    }
    
//    "id": "1",
//    "name": "man",
//    "numberBus": "3200",
//    "plateNumber": "3200",
//    "numberChairs": "50",
//    "company_id": "1"
    
}

