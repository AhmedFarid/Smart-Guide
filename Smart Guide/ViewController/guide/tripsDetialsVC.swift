//
//  tripsDetialsVC.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class tripsDetialsVC: UIViewController {
    
    var singleItem: guidesTrips?
    
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
    @IBOutlet weak var endtripBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busName.text = " اسم الحافله \(singleItem?.busName ?? "")"
        status.text = " الحاله \(singleItem?.status ?? "")"
        tripName.text = " اسم الرحله \(singleItem?.tripName ?? "")"
        guidName.text = " اسم المشرف \(singleItem?.supervisorName ?? "")"
        driverName.text = " اسم السائق \(singleItem?.driverName ?? "")"
        from.text = "  نقطه البدايه  \(singleItem?.from ?? "")"
        to.text = " نقطه النهايه \(singleItem?.to ?? "")"
        startDate.text = " موعد بدء الرحله \(singleItem?.dateStart ?? "")"
        endDate.text = " موعد انهاء الرحله \(singleItem?.dateEnd ?? "")"
        numberOfBassenger.text = " عدد الركاب \(singleItem?.numberPassenger ?? "")"
        
        
        if singleItem?.statusId == "1" || singleItem?.statusId == "7"{
            puseEntrip.setTitle("بداء الرحلة", for: UIControl.State.normal)
            endtripBtn.isHidden = true
            puseEntrip.isHidden = false
        }else if singleItem?.statusId == "2"{
            puseEntrip.setTitle("طلب تعليق", for: UIControl.State.normal)
            endtripBtn.isHidden = false
            puseEntrip.isHidden = false
        }else if singleItem?.statusId == "3" {
            puseEntrip.setTitle("إستكمال الرحله", for: UIControl.State.normal)
            endtripBtn.isHidden = false
            puseEntrip.isHidden = false
        }else {
            endtripBtn.isHidden = true
            puseEntrip.isHidden = true
        }
    }
    
    @IBAction func startTrip(_ sender: Any) {
        //
        if singleItem?.statusId == "1" || singleItem?.statusId == "7" || singleItem?.statusId == "3"{
            API_Guide.startTripGuide(trip_id: singleItem?.tripId ?? "", headings: "Start", message: "Start"){ (error: Error?, success, data,stutus) in
                if success {
                    if stutus == true{
                        let title = NSLocalizedString("بداء الرحله", comment: "profuct list lang")
                        let alert = UIAlertController(title: title, message: data ?? "", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "تم", style: UIAlertAction.Style.default, handler: { action in
                            let vc = UIStoryboard.init(name: "guide", bundle: Bundle.main).instantiateViewController(withIdentifier: "1") as? getTripsVC
                            self.navigationController?.pushViewController(vc!, animated: true)
                            
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }else {
                        let title = NSLocalizedString("بداء الرحله", comment: "profuct list lang")
                        self.showAlert(title: title, message: data ?? "")
                    }
                }else {
                    print("Error")
                }
            }
            print("start")
        }else if singleItem?.statusId == "2"{
            
            performSegue(withIdentifier: "suge", sender: nil)
            //            API_Guide.tripPause(trip_id: singleItem?.tripId ?? "", headings: "Puse", message: "Puse"){ (error: Error?, success, data,stutus) in
            //                if success {
            //                    if stutus == true{
            //                        let title = NSLocalizedString("تعديل الرحله", comment: "profuct list lang")
            //                        self.showAlert(title: title, message: data ?? "")
            //                    }else {
            //                        let title = NSLocalizedString("تعديل الرحله", comment: "profuct list lang")
            //                        self.showAlert(title: title, message: data ?? "")
            //                    }
            //                }else {
            //                    print("Error")
            //                }
            //            }
        }
    }
    @IBAction func mapCVBTN(_ sender: Any) {
        performSegue(withIdentifier: "mapSuge", sender: nil)
    }
    
    @IBAction func edtrip(_ sender: Any) {
        
        API_Guide.endTrip(trip_id: singleItem?.tripId ?? "", headings: "Puse", message: "Puse"){ (error: Error?, success, data,stutus) in
            if success {
                if stutus == true{
                    
                    let title = NSLocalizedString("انهاء الرحله", comment: "profuct list lang")
                    let alert = UIAlertController(title: title, message: data ?? "", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "تم", style: UIAlertAction.Style.default, handler: { action in
                        let vc = UIStoryboard.init(name: "guide", bundle: Bundle.main).instantiateViewController(withIdentifier: "1") as? getTripsVC
                        self.navigationController?.pushViewController(vc!, animated: true)
                        
                    }))
                    self.present(alert, animated: true, completion: nil)
                }else {
                    let title = NSLocalizedString("تعديل الرحله", comment: "profuct list lang")
                    self.showAlert(title: title, message: data ?? "")
                }
            }else {
                print("Error")
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? mapVC{
            destaiantion.singleItems = singleItem
        }else if let destaiantion = segue.destination as? taripsActionVC {
            destaiantion.singleItems = singleItem
        }else if let destaiantion = segue.destination as? endTripVC {
            destaiantion.singleItems = singleItem
        }
    }
}
