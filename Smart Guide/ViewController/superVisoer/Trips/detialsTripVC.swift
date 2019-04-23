//
//  detialsTripVC.swift
//  Smart Guide
//
//  Created by Farido on 4/4/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class detialsTripVC: UIViewController {
    
    var singleItem: trips?
    
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
    @IBOutlet weak var puseEntrip: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busName.text = " اسم الحافله \(singleItem?.busName ?? "")"
        status.text = " الحاله \(singleItem?.status ?? "")"
        tripName.text = " اسم الرحله \(singleItem?.tripName ?? "")"
        guidName.text = " اسم المرشد \(singleItem?.guideName ?? "")"
        driverName.text = " اسم السائق \(singleItem?.driverName ?? "")"
        from.text = " مكان بداء الرحله \(singleItem?.from ?? "")"
        to.text = " مكان الوصلو \(singleItem?.to ?? "")"
        startDate.text = " موعد بداء الرحله \(singleItem?.dateStart ?? "")"
        endDate.text = " موعد انهاء الرحله \(singleItem?.dateEnd ?? "")"
        numberOfBassenger.text = " عدد الركاب \(singleItem?.numberPassenger ?? "")"
        if singleItem?.status == "متواقف"{
            puseEntrip.setTitle("بداء الرحلة", for: UIControl.State.normal)
        }else {
            puseEntrip.setTitle("تعليق الرحلة", for: UIControl.State.normal)
        }
    }
    
    @IBAction func startTrip(_ sender: Any) {
        performSegue(withIdentifier: "suge1", sender: nil)
    }
    @IBAction func mapCVBTN(_ sender: Any) {
        performSegue(withIdentifier: "mapSuge", sender: nil)
    }
    @IBAction func editeBTN(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? editTripVC{
            destaiantion.singleItem = singleItem
        }else if let destaiantion = segue.destination as? mapVC {
            destaiantion.singleItem = singleItem
        }else if let destaiantion = segue.destination as? startTripVC{
            destaiantion.trip_id = singleItem?.tripId ?? ""
            destaiantion.tripStatus = singleItem?.status ?? ""
        }
    }
}
