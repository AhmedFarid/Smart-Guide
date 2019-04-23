//
//  taripsActionVC.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class taripsActionVC: UIViewController {

    @IBOutlet weak var head: roundedTF!
    @IBOutlet weak var massageTF: roundedTV!
    @IBOutlet weak var startUbateBTNOutle: UIButton!
    
    
    var singleItems: guidesTrips?
    var trip_id = ""
    var tripStatus = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if singleItems?.status == "متواقف"{
            startUbateBTNOutle.setTitle("طلب بداء الرحلة", for: UIControl.State.normal)
        }else {
            startUbateBTNOutle.setTitle("طلب تعليق الرحلة", for: UIControl.State.normal)
        }
    }
    
    @IBAction func startTrip(_ sender: Any) {
        if singleItems?.status == "متواقف"{
//            API_SuperVisour.startTrip(trip_id: trip_id, headings: head.text ?? "", message: massageTF.text ?? ""){ (error: Error?, success, data,stutus) in
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
            print("start")
        }else {
            API_Guide.tripPause(trip_id: singleItems?.tripId ?? "", headings: head.text ?? "", message: massageTF.text ?? ""){ (error: Error?, success, data,stutus) in
                if success {
                    if stutus == true{
                        let title = NSLocalizedString("تعديل الرحله", comment: "profuct list lang")
                        self.showAlert(title: title, message: data ?? "")
                    }else {
                        let title = NSLocalizedString("تعديل الرحله", comment: "profuct list lang")
                        self.showAlert(title: title, message: data ?? "")
                    }
                }else {
                    print("Error")
                }
            }
            
        }
    }
}
