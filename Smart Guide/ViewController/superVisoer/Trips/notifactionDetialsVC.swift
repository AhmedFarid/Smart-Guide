//
//  notifactionDetialsVC.swift
//  Smart Guide
//
//  Created by Farido on 7/4/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class notifactionDetialsVC: UIViewController {
    
    var singleItem: notifacations?
    var statusss = ""
    
    @IBOutlet weak var busName: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var guidName: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var numberOfBassenger: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        API_Notifications.notifactionDetiles(trip_id: singleItem?.trip_id ?? "") { (error, succes, trip_name, guide, driver, bus, path_from, path_to, number_passenger, start_date, end_date,statuss) in
            
            self.busName.text = " اسم الحافله \(bus ?? "")"
            self.status.text = " الحاله \(statuss ?? "")"
            self.tripName.text = " اسم الرحله \(trip_name ?? "")"
            self.guidName.text = " اسم المرشد \(guide ?? "")"
            self.driverName.text = " اسم السائق \(driver ?? "")"
            self.from.text = " مكان بداء الرحله \(path_from ?? "")"
            self.to.text = " مكان الوصلو \(path_to ?? "")"
            self.startDate.text = " موعد بداء الرحله \(start_date ?? "")"
            self.endDate.text = " موعد انهاء الرحله \(end_date ?? "")"
            self.numberOfBassenger.text = " عدد الركاب \(number_passenger ?? "")"
            self.statusss = statuss ?? ""
            
        }
    }
}
