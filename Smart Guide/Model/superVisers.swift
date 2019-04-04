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



class trips: NSObject {
    
    var tripId: String
    var tripName: String
    var companyId: String
    var companyName: String
    var guideId: String
    var guideName: String
    var memberId: String
    var memberName: String
    var driverId: String
    var driverName: String
    var busId: String
    var busName: String
    var numberPassenger: String
    var dateStart: String
    var dateEnd: String
    var from: String
    var to: String
    var startLat: String
    var startLng: String
    var endLat: String
    var endLng: String
    var status: String
    
    
    init?(dict: [String: JSON]){
        
        guard let tripId = dict["tripId"]?.string,let tripName = dict["tripName"]?.string,let companyId = dict["companyId"]?.string,let companyName = dict["companyName"]?.string,let guideId = dict["guideId"]?.string,let guideName = dict["guideName"]?.string,let memberId = dict["memberId"]?.string,let memberName = dict["memberName"]?.string,let driverId = dict["driverId"]?.string,let driverName = dict["driverName"]?.string,let busId = dict["busId"]?.string,let busName = dict["busName"]?.string,let numberPassenger = dict["numberPassenger"]?.string,let dateStart = dict["dateStart"]?.string,let dateEnd = dict["dateEnd"]?.string,let from = dict["from"]?.string,let to = dict["to"]?.string,let startLat = dict["startLat"]?.string,let startLng = dict["startLng"]?.string,let endLat = dict["endLat"]?.string,let endLng = dict["endLng"]?.string,let status = dict["status"]?.string  else {return nil}
        
        
        
        self.tripId = tripId
        self.tripName = tripName
        self.companyId = companyId
        self.companyName = companyName
        self.guideId = guideId
        self.memberId = memberId
        self.memberName = memberName
        self.driverId = driverId
        self.driverName = driverName
        self.busId = busId
        self.busName = busName
        self.numberPassenger = numberPassenger
        self.dateStart = dateStart
        self.dateEnd = dateEnd
        self.from = from
        self.to = to
        self.startLat = startLat
        self.startLng = startLng
        self.endLng = endLng
        self.status = status
        self.guideName = guideName
        self.endLat = endLat
    }
    
}

//"": "5",
//"": "welcome",
//"": "1",
//"": "e-bakers",
//"": "1",
//"": "waaaa",
//"": "1",
//"": "Mahmoud ahmed",
//"": "1",
//"": "Khaled mahmoud",
//"": "1",
//"": "man",
//"": "50",
//"": "2012-12-06 01:25:00",
//"": "2013-12-06 01:25:00",
//"": "الرياض",
//"": "مكة",
//"": null,
//"": null,
//"": null,
//"": null,
//"": "نشط"
