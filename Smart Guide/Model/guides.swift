//
//  guides.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import SwiftyJSON

class guides: NSObject {

}

class guidesTrips: NSObject {
    
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
    var price: String
    var status: String
    var lngEnd: String
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

class getRequestPauseTrips: NSObject {
    
    var requestId: Int
    var from: String
    var to: String
    var tripId: String
    var status: String
    var companyId: String
    var driver_id: String
    var driverName: String
    var guideId: String
    var guideName: String
    var busId: String
    var busNumber: String
    var pathId: String
    var startTime: String
    var startDate: String
    var mobil_guide: String
    
    
    init?(dict: [String: JSON]){
        
        guard let requestId = dict["requestId"]?.int,let from = dict["from"]?.string,let to = dict["to"]?.string,let tripId = dict["tripId"]?.string,let status = dict["status"]?.string,let companyId = dict["companyId"]?.string,let driver_id = dict["driver_id"]?.string,let driverName = dict["driverName"]?.string,let guideId = dict["guideId"]?.string,let guideName = dict["guideName"]?.string,let busId = dict["busId"]?.string,let busNumber = dict["busNumber"]?.string,let pathId = dict["pathId"]?.string,let startTime = dict["startTime"]?.string,let startDate = dict["startDate"]?.string,let mobil_guide = dict["mobil_guide"]?.string else {return nil}
        self.requestId = requestId
        self.from = from
        self.to = to
        self.tripId = tripId
        self.status = status
        self.companyId = companyId
        self.driver_id = driver_id
        self.driverName = driverName
        self.guideId = guideId
        self.guideName = guideName
        self.busId = busId
        self.busNumber = busNumber
        self.pathId = pathId
        self.startTime = startTime
        self.startDate = startDate
        self.mobil_guide = mobil_guide
    }
}
