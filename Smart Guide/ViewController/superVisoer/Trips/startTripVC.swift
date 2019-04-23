//
//  startTripVC.swift
//  Smart Guide
//
//  Created by Farido on 4/22/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class startTripVC: UIViewController {
    
    @IBOutlet weak var head: roundedTF!
    @IBOutlet weak var massageTF: roundedTV!
    
    var trip_id = ""
    var tripStatus = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startTrip(_ sender: Any) {
        if tripStatus == "متواقف"{
            API_SuperVisour.startTrip(trip_id: trip_id, headings: head.text ?? "", message: massageTF.text ?? ""){ (error: Error?, success, data,stutus) in
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
            }else {
            API_SuperVisour.tripPause(trip_id: trip_id, headings: head.text ?? "", message: massageTF.text ?? "", status: "10"){ (error: Error?, success, data,stutus) in
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