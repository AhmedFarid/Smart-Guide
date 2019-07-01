//
//  editTripVC.swift
//  Smart Guide
//
//  Created by Farido on 4/21/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class editTripVC: UIViewController {

    var singleItem: trips?
    
    @IBOutlet weak var statusTF: roundedTF!
    var stute = Array<stues>()
    var selectedStutes = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createmeStatusPiker()
        statusTF.text = singleItem?.status
    }
    
    func  ReadTheStuts(){
        let bath = Bundle.main.path(forResource: "status", ofType: "plist")!
        let url = URL(fileURLWithPath: bath)
        let data = try! Data(contentsOf: url)
        let plist =  try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        let dictArry = plist as! [[String:String]]
        for dic  in dictArry {
            stute.append(stues(id: dic["id"] ?? "", name: dic["name"] ?? ""))
        }
    }
    
    func createmeStatusPiker(){
        ReadTheStuts()
        let stutesPiker = UIPickerView()
        stutesPiker.delegate = self
        stutesPiker.dataSource = self
        stutesPiker.tag = 0
        statusTF.inputView = stutesPiker
    }
    
    
    
    @IBAction func saveBTN(_ sender: Any) {
        API_SuperVisour.editTrip(trip_id: singleItem?.tripId ?? "", status: selectedStutes){ (error: Error?, success, data,stutus) in
            if success {
                if stutus == true{
                    let title = NSLocalizedString("تعديل الرحله", comment: "profuct list lang")
                    let alert = UIAlertController(title: title, message: data ?? "", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "تم", style: UIAlertAction.Style.default, handler: { action in
                        let vc = UIStoryboard.init(name: "supervisor", bundle: Bundle.main).instantiateViewController(withIdentifier: "1") as? homeSuperVC
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
    
}


extension editTripVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return stute.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return stute[row].name
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            statusTF.text = stute[row].name
            selectedStutes = stute[row].id ?? ""
            self.view.endEditing(false)
    }
}


