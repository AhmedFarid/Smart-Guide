//
//  endTripVC.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class endTripVC: UIViewController {
    
    @IBOutlet weak var head: roundedTF!
    @IBOutlet weak var massageTF: roundedTV!
    @IBOutlet weak var startUbateBTNOutle: UIButton!
    
    
    var singleItems: guidesTrips?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startTrip(_ sender: Any) {
        API_Guide.endTrip(trip_id: singleItems?.tripId ?? "", headings: head.text ?? "", message: massageTF.text ?? ""){ (error: Error?, success, data,stutus) in
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
