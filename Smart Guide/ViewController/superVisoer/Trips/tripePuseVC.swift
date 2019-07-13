//
//  tripePuseVC.swift
//  Smart Guide
//
//  Created by Farido on 4/24/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class tripePuseVC: UIViewController {

    var singleItem: getRequestPauseTrips?
    
    @IBOutlet weak var busName: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var guidName: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        busName.text = " اسم الحافله \(singleItem?.busNumber ?? "")"
        guidName.text = " اسم المرشد \(singleItem?.guideName ?? "")\n\nرقم المرشد \(singleItem?.mobil_guide ?? "")"
        driverName.text = " اسم السائق \(singleItem?.driverName ?? "")"
        from.text = " مكان بداء الرحله \(singleItem?.from ?? "")"
        to.text = " مكان الوصلو \(singleItem?.to ?? "")"
        startDate.text = " موعد بداء الرحله \(singleItem?.startTime ?? "")"
    }
    
    @IBAction func startTrip(_ sender: Any) {
        API_SuperVisour.requestAnswer(type: "yes",requestId: singleItem?.requestId ?? 0, headings: "لقد وافقت علي الطلب",message: "لقد وافقت علي الطلب"){ (error: Error?, success, data,stutus) in
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
    
    @IBAction func callGuid(_ sender: Any) {
        if let url = URL(string: "tel://\(singleItem?.mobil_guide ?? "")"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // add error message here
        }
    }
    
    @IBAction func mapCVBTN(_ sender: Any) {
        API_SuperVisour.requestAnswer(type: "no",requestId: singleItem?.requestId ?? 0, headings: "لقد رفضت علي الطلب",message: "لقد رفضت علي الطلب"){ (error: Error?, success, data,stutus) in
            if success {
                if stutus == true{
                    let title = NSLocalizedString("تعليق الطلب", comment: "profuct list lang")
                    self.showAlert(title: title, message: data ?? "")
                }else {
                    let title = NSLocalizedString("تعليق الطلب", comment: "profuct list lang")
                    self.showAlert(title: title, message: data ?? "")
                }
            }else {
                print("Error")
            }
        }
    }
}
