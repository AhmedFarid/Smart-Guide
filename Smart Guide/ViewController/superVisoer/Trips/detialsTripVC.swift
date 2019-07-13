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
    //var singleItems: notifacations?
    
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
    @IBOutlet weak var cancelBTNOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busName.text = " اسم الحافله \(singleItem?.busName ?? "")"
        status.text = " الحاله \(singleItem?.status ?? "")"
        tripName.text = " اسم الرحله \(singleItem?.tripName ?? "")"
        guidName.text = " اسم المرشد \(singleItem?.guideName ?? "")"
        driverName.text = " اسم السائق \(singleItem?.driverName ?? "")"
        from.text = "نقطه البداية \(singleItem?.from ?? "")"
        to.text = "نقطه النهايه \(singleItem?.to ?? "")"
        startDate.text = " موعد بدء الرحله \(singleItem?.dateStart ?? "")"
        endDate.text = " موعد انهاء الرحله \(singleItem?.dateEnd ?? "")"
        numberOfBassenger.text = " عدد الركاب \(singleItem?.numberPassenger ?? "")"
        
        if singleItem?.statusId  == "1"{
            puseEntrip.setTitle("تعليق الرحله", for: UIControl.State.normal)
        }else if singleItem?.statusId  == "3"{
            puseEntrip.setTitle("استكمال الرحله", for: UIControl.State.normal)
        }else if singleItem?.statusId  == "7"{
            puseEntrip.setTitle("تعليق الرحله", for: UIControl.State.normal)
        }else if singleItem?.statusId == "4"{
            puseEntrip.isHidden = true
            cancelBTNOut.isHidden = true
            
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
    
    @IBAction func cancelBTN(_ sender: Any) {
        API_SuperVisour.cancelTrrips(trip_id: singleItem?.tripId ?? ""){ (error: Error?, success, data,stutus) in
            if success {
                if stutus == true{
                    let title = NSLocalizedString("الغاء الرحله", comment: "profuct list lang")
                    let alert = UIAlertController(title: title, message: data ?? "", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "تم", style: UIAlertAction.Style.default, handler: { action in
                        let vc = UIStoryboard.init(name: "supervisor", bundle: Bundle.main).instantiateViewController(withIdentifier: "1") as? homeSuperVC
                        self.navigationController?.pushViewController(vc!, animated: true)
                        
                    }))
                    self.present(alert, animated: true, completion: nil)
                }else {
                    let title = NSLocalizedString("تعليق الرحله", comment: "profuct list lang")
                    self.showAlert(title: title, message: data ?? "")
                }
            }else {
                print("Error")
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? editTripVC{
            destaiantion.singleItem = singleItem
        }else if let destaiantion = segue.destination as? mapVC {
            destaiantion.singleItem = singleItem
        }else if let destaiantion = segue.destination as? startTripVC{
            destaiantion.trip_id = singleItem?.tripId ?? ""
            destaiantion.tripStatus = singleItem?.statusId ?? ""
        }
    }
}
