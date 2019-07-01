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
    
    var type = ["عطل فني","حادث","زحمه سير","اخري"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBussPiker()
        
        if singleItems?.statusId == "1"{
            startUbateBTNOutle.setTitle("بداء الرحلة", for: UIControl.State.normal)
        }else if singleItems?.statusId == "3"{
            startUbateBTNOutle.setTitle("بداء الرحلة", for: UIControl.State.normal)
        }else if singleItems?.statusId == "7"{
            startUbateBTNOutle.setTitle("بداء الرحلة", for: UIControl.State.normal)
        }else {
            startUbateBTNOutle.setTitle("تعليق الرحلة", for: UIControl.State.normal)
        }
    }
    
    
    func createBussPiker(){
        let busPiker = UIPickerView()
        busPiker.delegate = self
        busPiker.dataSource = self
        head.inputView = busPiker
        busPiker.reloadAllComponents()
    }
    
    @IBAction func startTrip(_ sender: Any) {
        if singleItems?.statusId == "1" || singleItems?.statusId == "3" ||  singleItems?.statusId == "7"{
//            API_Guide.startTripGuide(trip_id: singleItems?.tripId ?? "", headings: head.text ?? "", message: massageTF.text ?? ""){ (error: Error?, success, data,stutus) in
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
//            print("start")
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

extension taripsActionVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        head.text = type[row]
        self.view.endEditing(false)
    }
}

