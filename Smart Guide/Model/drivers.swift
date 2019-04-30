//
//  drivers.swift
//  Smart Guide
//
//  Created by Farido on 4/30/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import SwiftyJSON

class drivers: NSObject {
    
    var tripId: String
    var tripName: String
    var companyId: String
    var companyName: String
    var guideId: String
    var guideName: String
    var supervisorId: String
    var supervisorName: String
    var driverId: String
    var driverName: String
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
        
        guard let tripId = dict["tripId"]?.string,let tripName = dict["tripName"]?.string,let companyId = dict["companyId"]?.string,let companyName = dict["companyName"]?.string,let guideId = dict["guideId"]?.string,let guideName = dict["guideName"]?.string,let supervisorId = dict["supervisorId"]?.string,let supervisorName = dict["supervisorName"]?.string,let driverId = dict["driverId"]?.string,let driverName = dict["driverName"]?.string,let busName = dict["busName"]?.string,let numberPassenger = dict["numberPassenger"]?.string,let dateStart = dict["dateStart"]?.string,let dateEnd = dict["dateEnd"]?.string,let from = dict["from"]?.string,let to = dict["to"]?.string,let latStart = dict["latStart"]?.string,let lngStart = dict["lngStart"]?.string,let latEnd = dict["latEnd"]?.string,let price = dict["price"]?.string,let status = dict["status"]?.string,let lngEnd = dict["lngEnd"]?.string,let statusId = dict["statusId"]?.string  else {return nil}
        
        
        
        self.tripId = tripId
        self.tripName = tripName
        self.companyId = companyId
        self.companyName = companyName
        self.guideId = guideId
        self.guideName = guideName
        //self.busId = busId
        self.supervisorId = supervisorId
        self.supervisorName = supervisorName
        self.driverId = driverId
        self.driverName = driverName
        self.busName = busName
        self.numberPassenger = numberPassenger
        self.dateStart = dateStart
        self.dateEnd = dateEnd
        self.from = from
        self.to = to
        self.latStart = latStart
        self.latStart = latStart
        self.latEnd = latEnd
        self.lngEnd = lngEnd
        self.price = price
        self.status = status
        self.lngStart = lngStart
        self.statusId = statusId
    }
    
    

}


//"tripId": "2",
//"tripName": "مرحبا",
//"companyId": "1",
//"companyName": "مرحبا",
//"guideId": "1",
//"guideName": "محمود اجمد",
//"supervisorId": "1",
//"supervisorName": "وليد",
//"driverId": "1",
//"driverName": "محمود اجمد",
//"busName": "المهندسين",
//"numberPassenger": "60",
//"dateStart": "06-12-2012 01:04 AM",
//"dateEnd": "06-12-2013 01:04 AM",
//"from": "لحوم",
//"to": "المهندسين",
//"latStart": "30.00916944325995",
//"lngStart": "31.48141829013821",
//"latEnd": "29.986126114805526",
//"lngEnd": "31.213540711402857",
//"price": "1.00",
//"status": "معلق",
//"statusId": "3"
