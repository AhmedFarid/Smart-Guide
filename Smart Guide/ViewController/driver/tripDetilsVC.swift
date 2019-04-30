//
//  tripDetilsVC.swift
//  Smart Guide
//
//  Created by Farido on 4/30/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class tripDetilsVC: UIViewController {

    var singleItem: drivers?
    
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
        guidName.text = " اسم المشرف \(singleItem?.supervisorName ?? "")"
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
        performSegue(withIdentifier: "suge", sender: nil)
    }
    @IBAction func mapCVBTN(_ sender: Any) {
        performSegue(withIdentifier: "mapSuge", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? driverMapVC{
            destaiantion.singleItems = singleItem
//        }else if let destaiantion = segue.destination as? taripsActionVC {
//            destaiantion.singleItems = singleItem
//        }else if let destaiantion = segue.destination as? endTripVC {
//            destaiantion.singleItems = singleItem
//        }
//    }
    }
  }
}
