//
//  notifacations.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import SwiftyJSON

class notifacations: NSObject {
    
    var supervisorName: String?
    var driverName: String?
    var guideName: String?
    var headings: String?
    var message: String?
    var trip_id: String?
    
    init?(dict: [String: JSON]){
        let supervisorName = dict["supervisorName"]?.string
        let driverName = dict["driverName"]?.string
        let guideName = dict["guideName"]?.string
        let message = dict["message"]?.string
        let headings = dict["headings"]?.string
        let trip_id = dict["trip_id"]?.string

        self.supervisorName = supervisorName
        self.driverName = driverName
        self.guideName = guideName
        self.message = message
        self.headings = headings
        self.trip_id = trip_id
    }
}
