//
//  tripDetilsVC.swift
//  Smart Guide
//
//  Created by Farido on 4/30/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import Firebase

class tripDetilsVC: UIViewController {

    var singleItem: drivers?
    var statusType = ""
    
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
        readStatus()
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
        if singleItem?.statusId == "2" || singleItem?.statusId == "6"{
            puseEntrip.isHidden = false
        }else {
            puseEntrip.isHidden = true
        }
    }
    
    func readStatus(){
        let ref = Database.database().reference().child("buses/\(helper.getAPIToken().companyId ?? "")/\(singleItem?.tripId ?? "")")
        print(ref)
        ref.observe(.value) { (snapshot: DataSnapshot) in
            if let data = snapshot.value as? [String:AnyObject]{
                if let statusType = data["status"] as? String{
                    print(statusType)
                    self.statusType = statusType
                    print("xxxxxxx\(statusType)")
                }
            }
        }
        //refbus.removeAllObservers()
    }
    
    @IBAction func startTrip(_ sender: Any) {
        //performSegue(withIdentifier: "suge", sender: nil)
        API_Driver.endTrip(trip_id: singleItem?.tripId ?? "", headings: "end", message: "End"){ (error: Error?, success, data,stutus) in
            if success {
                if stutus == true{
                    let title = NSLocalizedString("انهاء", comment: "profuct list lang")
                    self.showAlert(title: title, message: data ?? "")
                }else {
                    let title = NSLocalizedString("انهاء", comment: "profuct list lang")
                    self.showAlert(title: title, message: data ?? "")
                }
            }else {
                print("Error")
            }
        }
        if statusType == "off"{
            let ref = Database.database().reference().child("buses/\(helper.getAPIToken().companyId ?? "")/\(singleItem?.tripId ?? "")")
            ref.child("status").setValue("on")
            //puseEntrip.setTitle("انهاء الرحله", for: UIControl.State.normal)
            //self.showAlert(title: "حاله الرحله", message: "تم بداء الرحله")
        }else {
            let ref = Database.database().reference().child("buses/\(helper.getAPIToken().companyId ?? "")/\(singleItem?.tripId ?? "")")
            ref.child("status").setValue("off")
            //puseEntrip.setTitle("بداء الرحله", for: UIControl.State.normal)
            //self.showAlert(title: "حاله الرحله", message: "تم انهاء الرحله")
        }
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
