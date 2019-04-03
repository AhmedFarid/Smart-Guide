//
//  addTripVC.swift
//  Smart Guide
//
//  Created by farid on 3/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class addTripVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameARTF: roundedTF!
    @IBOutlet weak var nameEnTF: roundedTF!
    @IBOutlet weak var guidNameTF: roundedTF!
    @IBOutlet weak var busNumTF: roundedTF!
    @IBOutlet weak var driverNameTF: roundedTF!
    @IBOutlet weak var memberNameTF: roundedTF!
    @IBOutlet weak var reciverPalceTF: roundedTF!
    @IBOutlet weak var downPalceTF: roundedTF!
    @IBOutlet weak var startTime: roundedTF!
    @IBOutlet weak var EndTime: roundedTF!
    
    var guide = [superViserGuides]()
    var drivers = [superViserDriver]()
    var member = [superViserMember]()
    var buss = [superViserBus]()
    
    var guides = ""
    var driver = ""
    var members = ""
    var bus = ""
    private var datePiker: UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textEnabeld()
        createBussPiker()
        createmeMemberPiker()
        createmeDriversPiker()
        createmeGuidePiker()
        createDateStart()
        createDateEnd()
    }
    
    func createDateStart(){
        
        datePiker = UIDatePicker()
        datePiker?.datePickerMode = .dateAndTime
        datePiker?.addTarget(self, action: #selector(addTripVC.dateChanged(datePiker:)), for: .valueChanged)
        self.view.endEditing(false)
        startTime.inputView = datePiker
        
    }
    
    @objc func dateChanged(datePiker: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        startTime.text = dateFormater.string(from: datePiker.date)
        view.endEditing(true)
    }
    
    func createDateEnd(){
        
        datePiker = UIDatePicker()
        datePiker?.datePickerMode = .dateAndTime
        datePiker?.addTarget(self, action: #selector(addTripVC.dateChangedend(datePiker:)), for: .valueChanged)
        self.view.endEditing(false)
        EndTime.inputView = datePiker
        
    }
    
    @objc func dateChangedend(datePiker: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        EndTime.text = dateFormater.string(from: datePiker.date)
        view.endEditing(true)
    }
    
    
    @objc private func handleRefreshGuide() {
        API_SuperVisour.getGuide{ (error: Error?, guide: [superViserGuides]?) in
            if let guide = guide {
                self.guide = guide
                print("xxx\(self.guide)")
                self.textEnabeld()
            }
        }
        
    }
    
    @objc private func handleRefreshDrivers() {
        API_SuperVisour.getDriver{ (error: Error?, drivers: [superViserDriver]?) in
            if let drivers = drivers {
                self.drivers = drivers
                print("xxx\(self.drivers)")
                self.textEnabeld()
            }
        }
        
    }
    
    @objc private func handleRefreshMember() {
        API_SuperVisour.getMember{ (error: Error?, member: [superViserMember]?) in
            if let member = member {
                self.member = member
                print("xxx\(self.member)")
                self.textEnabeld()
            }
        }
        
    }
    
    @objc private func handleRefreshBuss() {
        API_SuperVisour.getBus{ (error: Error?, buss: [superViserBus]?) in
            if let buss = buss {
                self.buss = buss
                print("xxx\(self.buss)")
                self.textEnabeld()
            }
        }
        
    }
    
    
    func textEnabeld() {
        if guide.isEmpty == true {
            guidNameTF.isEnabled = false
        }else {
            guidNameTF.isEnabled = true
        }
        
        if drivers.isEmpty == true {
            driverNameTF.isEnabled = false
        }else {
            driverNameTF.isEnabled = true
        }
        
        if member.isEmpty == true {
            memberNameTF.isEnabled = false
        }else {
            memberNameTF.isEnabled = true
        }
        if buss.isEmpty == true {
            busNumTF.isEnabled = false
        }else {
            busNumTF.isEnabled = true
        }
    }
    
    func createBussPiker(){
        let busPiker = UIPickerView()
        busPiker.delegate = self
        busPiker.dataSource = self
        busPiker.tag = 0
        busNumTF.inputView = busPiker
        handleRefreshBuss()
        busPiker.reloadAllComponents()
    }
    
    func createmeMemberPiker(){
        let memberPiker = UIPickerView()
        memberPiker.delegate = self
        memberPiker.dataSource = self
        memberPiker.tag = 1
        memberNameTF.inputView = memberPiker
        handleRefreshMember()
        memberPiker.reloadAllComponents()
    }
    
    func createmeDriversPiker(){
        let driversPiker = UIPickerView()
        driversPiker.delegate = self
        driversPiker.dataSource = self
        driversPiker.tag = 2
        driverNameTF.inputView = driversPiker
        handleRefreshDrivers()
        driversPiker.reloadAllComponents()
    }
    
    func createmeGuidePiker(){
        let GuidePiker = UIPickerView()
        GuidePiker.delegate = self
        GuidePiker.dataSource = self
        GuidePiker.tag = 3
        guidNameTF.inputView = GuidePiker
        handleRefreshGuide()
        GuidePiker.reloadAllComponents()
    }
    
    
    @IBAction func addTrips(_ sender: Any) {
        guard (helper.getAPIToken().userToken != nil)  else {
            let messages = NSLocalizedString("please login frist", comment: "hhhh")
            let title = NSLocalizedString("Filed to request order", comment: "profuct list lang")
            self.showAlert(title: messages, message: title)
            return
        }
        
        
        guard let nameAr = nameARTF.text, !nameAr.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("ادخل الاسم عربي", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        guard let nameEn = nameEnTF.text, !nameEn.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("ادخل الاسم اللاتيني", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        guard let giudName = guidNameTF.text, !giudName.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("ادخل اسم المرشد", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        guard let busName = busNumTF.text, !busName.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("ادخل رقم الحافله ", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        
        guard let driverName = driverNameTF.text, !driverName.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("ادخل اسم السائق ", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        guard let member = memberNameTF.text, !member.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("اضافه عضو نقل وتصعيد", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        guard let recivePalce = reciverPalceTF.text, !recivePalce.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("اضافه مكان الاستلام", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        guard let downPalce = downPalceTF.text, !downPalce.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("اضافه مكن التسليم", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        
        guard let startTim = startTime.text, !startTim.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("اضافه وقت بداء الرحله", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        guard let endTimes = EndTime.text, !endTimes.isEmpty else {
            let messages = NSLocalizedString("اضافه رحله", comment: "hhhh")
            let title = NSLocalizedString("اضافه وقت انتهاء الرحله", comment: "hhhh")
            self.showAlert(title: messages, message: title)
            return
        }
        
        API_SuperVisour.addTrib(name_en: nameEn, name_ar: nameAr, guide_id: guides, member_id: members, driver_id: driver, bus_id: bus, from: recivePalce, to: downPalce, date_time_start: startTim, date_time_end: endTimes, start_lat: "0", start_lng: "0", end_lat: "0", end_lng: "0"){ (error: Error?, success, data) in
            if success {
                let title = NSLocalizedString("اضافه رحله", comment: "profuct list lang")
                self.showAlert(title: title, message: data ?? "")
            }else {
                print("Error")
            }
        }
        
        
        
        
    }
    
    
    
}



extension addTripVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            return buss.count
        }else if pickerView.tag == 1{
            return member.count
        }else if pickerView.tag == 2 {
            return drivers.count
        }else {
            return guide.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
            return buss[row].name
        }else if pickerView.tag == 1{
            return member[row].name
        }else if pickerView.tag == 2 {
            return drivers[row].name
        }else {
            return guide[row].name
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            busNumTF.text = buss[row].name
            bus = buss[row].id
            self.view.endEditing(false)
        }else if pickerView.tag == 1{
            memberNameTF.text = member[row].name
            members = member[row].id
            self.view.endEditing(false)
        }else if pickerView.tag == 2 {
            driverNameTF.text = drivers[row].name
            driver = drivers[row].id
            self.view.endEditing(false)
        }else {
            guidNameTF.text = guide[row].name
            guides = guide[row].id
            self.view.endEditing(false)
        }
    }
}

