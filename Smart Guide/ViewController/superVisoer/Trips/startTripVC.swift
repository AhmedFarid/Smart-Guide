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
    @IBOutlet weak var startUbateBTNOutle: UIButton!
    
    var trip_id = ""
    var tripStatus = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tripStatus == "1"{
            startUbateBTNOutle.setTitle("تعليق الرحله", for: UIControl.State.normal)
        }else if tripStatus == "3"{
            startUbateBTNOutle.setTitle("استكمال الرحله", for: UIControl.State.normal)
        }else if tripStatus == "7"{
            startUbateBTNOutle.setTitle("تعليق الرحله", for: UIControl.State.normal)
        }else {
            startUbateBTNOutle.setTitle("تعليق الرحلة", for: UIControl.State.normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if tripStatus == "1"{
            startUbateBTNOutle.setTitle("تعليق الرحله", for: UIControl.State.normal)
        }else if tripStatus == "3"{
            startUbateBTNOutle.setTitle("استكمال الرحله", for: UIControl.State.normal)
        }else if tripStatus == "7"{
            startUbateBTNOutle.setTitle("تعليق الرحله", for: UIControl.State.normal)
        }else {
            startUbateBTNOutle.setTitle("تعليق الرحلة", for: UIControl.State.normal)
        }
    }
    
    @IBAction func startTrip(_ sender: Any) {
       // if tripStatus == "1" || tripStatus == "3" ||  tripStatus == "7"{
         if tripStatus == "3"{
            API_SuperVisour.startTrip(trip_id: trip_id, headings: head.text ?? "", message: massageTF.text ?? ""){ (error: Error?, success, data,stutus) in
                if success {
                    if stutus == true{
                        let title = NSLocalizedString("إستكامل الرحله", comment: "profuct list lang")
                        let alert = UIAlertController(title: title, message: data ?? "", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "تم", style: UIAlertAction.Style.default, handler: { action in
                            let vc = UIStoryboard.init(name: "supervisor", bundle: Bundle.main).instantiateViewController(withIdentifier: "1") as? homeSuperVC
                            self.navigationController?.pushViewController(vc!, animated: true)

                        }))
                        self.present(alert, animated: true, completion: nil)
//
//                        self.showAlert(title: title, message:
                    }else {
                        let title = NSLocalizedString("بداء الرحله", comment: "profuct list lang")
                        self.showAlert(title: title, message: data ?? "")
                    }
                }else {
                    print("Error")
                }
            }
            }else if tripStatus == "1" || tripStatus == "7"{
            API_SuperVisour.tripPause(trip_id: trip_id, headings: head.text ?? "", message: massageTF.text ?? "", status: "3"){ (error: Error?, success, data,stutus) in
                if success {
                    if stutus == true{
                        let title = NSLocalizedString("تعليق الرحله", comment: "profuct list lang")
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
            
         }else {
            
        }
    }
}
