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
    var price: String
    var userTokenCompany: String
    
    
    
    init?(dict: [String: JSON]){
        
        guard let id = dict["id"]?.string,let name = dict["from_to"]?.string,let price = dict["price"]?.string,let userTokenCompany = dict["userTokenCompany"]?.string else {return nil}
        self.id = id
        self.name = name
        self.price = price
        self.userTokenCompany = userTokenCompany
    }
//    /"from_to" : "فراخ | Welcome asdasdasd",
//    "id" : "1",
//    "price" : "20.00",
//    "userTokenCompany" : "CZxXhVi4G7sl9o9pJSy7hy5aUh74V2wgDRn2nAGoQvrmB171nOph7OJV5sKp"
//
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

class stues{
    var id: String?
    var name: String?
    
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}




class trips: NSObject {
    
    var tripId: String
    var tripName: String
    var companyId: String
    var companyName: String
    var guideName: String
    var driverName: String
    //var busId: String
    var busName: String
    var numberPassenger: String
    var dateStart: String
    var dateEnd: String
    var from: String
    var to: String
    var latStart: String
    var lngStart: String
    var latEnd: String
    var lngEnd: String
    var price: String
    var status: String
    var statusId: String
    
    init?(dict: [String: JSON]){
        
        guard let tripId = dict["tripId"]?.string,let tripName = dict["tripName"]?.string,let companyId = dict["companyId"]?.string,let companyName = dict["companyName"]?.string,let guideName = dict["guideName"]?.string,let driverName = dict["driverName"]?.string,let busName = dict["busName"]?.string,let numberPassenger = dict["numberPassenger"]?.string,let dateStart = dict["dateStart"]?.string,let dateEnd = dict["dateEnd"]?.string,let from = dict["from"]?.string,let to = dict["to"]?.string,let latStart = dict["latStart"]?.string,let lngStart = dict["lngStart"]?.string,let latEnd = dict["latEnd"]?.string,let lngEnd = dict["lngEnd"]?.string,let price = dict["price"]?.string,let status = dict["status"]?.string,let statusId = dict["statusId"]?.string  else {return nil}
        
        
        
        self.tripId = tripId
        self.tripName = tripName
        self.companyId = companyId
        self.companyName = companyName
        self.guideName = guideName
        self.driverName = driverName
        //self.busId = busId
        self.busName = busName
        self.numberPassenger = numberPassenger
        self.dateStart = dateStart
        self.dateEnd = dateEnd
        self.from = from
        self.to = to
        self.latStart = latStart
        self.lngStart = lngStart
        self.latEnd = latEnd
        self.lngEnd = lngEnd
        self.price = price
        self.status = status
        self.statusId = statusId
    }
    

}
