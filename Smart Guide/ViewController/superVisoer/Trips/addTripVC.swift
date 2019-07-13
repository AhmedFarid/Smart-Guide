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
    @IBOutlet weak var startTime: roundedTF!
    @IBOutlet weak var EndTime: roundedTF!
    @IBOutlet weak var stutse: roundedTF!
    @IBOutlet weak var price: roundedTF!
    @IBOutlet weak var numberOfpassange: roundedTF!
    @IBOutlet weak var statesSwitch: UISegmentedControl!
    @IBOutlet weak var startTimeTF: roundedTF!
    @IBOutlet weak var endTimeTF: roundedTF!
    
    
    
    var singleItem: trips?
    var guide = [superViserGuides]()
    var drivers = [superViserDriver]()
    var member = [superViserMember]()
    var buss = [superViserBus]()
    
    var stute = Array<stues>()
    
    var guides = ""
    var driverID = ""
    var members = ""
    var bus = ""
    var selectedStutes = ""
    var prices = ""
    var careeID = ""
    var states = "7"
    
    private var datePiker: UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stutse.isEnabled = false
        self.price.isEnabled = false
        textEnabeld()
        //createmeStatusPiker()
        createmeMemberPiker()
        //createmeDriversPiker()
        //createmeGuidePiker()
        createDateStart()
        createDateEnd()
        createBussPiker()
        createDateStartTime()
        createDateEndTime()
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
    
    func createDateStart(){
        datePiker = UIDatePicker()
        datePiker?.datePickerMode = .date
        datePiker?.calendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
        
        datePiker?.addTarget(self, action: #selector(addTripVC.dateChanged(datePiker:)), for: .valueChanged)
        self.view.endEditing(false)
        startTime.inputView = datePiker
        
    }
    
    func createDateStartTime(){
        
        datePiker = UIDatePicker()
        datePiker?.datePickerMode = .time
        datePiker?.calendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
        
        datePiker?.addTarget(self, action: #selector(addTripVC.dateChangedStartTime(datePiker:)), for: .valueChanged)
        self.view.endEditing(false)
        startTimeTF.inputView = datePiker
        
    }
    
    @objc func dateChangedStartTime(datePiker: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale.init(identifier: "en")
        dateFormater.dateFormat = "HH:mm:ss"
        startTimeTF.text = dateFormater.string(from: datePiker.date)
        view.endEditing(true)
    }
    
    func createDateEndTime(){
        
        datePiker = UIDatePicker()
        datePiker?.datePickerMode = .time
        datePiker?.calendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
        
        datePiker?.addTarget(self, action: #selector(addTripVC.dateChangedEndTime(datePiker:)), for: .valueChanged)
        self.view.endEditing(false)
        endTimeTF.inputView = datePiker
        
    }
    
    @objc func dateChangedEndTime(datePiker: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale.init(identifier: "en")
        dateFormater.dateFormat = "HH:mm:ss"
        endTimeTF.text = dateFormater.string(from: datePiker.date)
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePiker: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.locale = NSLocale(localeIdentifier: "en_SA") as Locale
        dateFormater.dateFormat = "yyyy-MM-dd"
        startTime.text = dateFormater.string(from: datePiker.date)
        view.endEditing(true)
    }
    
    func createDateEnd(){
        
        datePiker = UIDatePicker()
        datePiker?.datePickerMode = .date
        datePiker?.calendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
        datePiker?.addTarget(self, action: #selector(addTripVC.dateChangedend(datePiker:)), for: .valueChanged)
        self.view.endEditing(false)
        EndTime.inputView = datePiker
        
    }
    
    @objc func dateChangedend(datePiker: UIDatePicker) {
        let dateFormater = DateFormatter()
        dateFormater.locale = NSLocale(localeIdentifier: "en_SA") as Locale
        dateFormater.dateFormat = "yyyy-MM-dd"
        EndTime.text = dateFormater.string(from: datePiker.date)
        view.endEditing(true)
    }
    
    
    @objc private func handleRefreshGuide() {
        API_SuperVisour.getGuide(bus_id: bus){ (error: Error?, guide: [superViserGuides]?,id,name) in
            if let guide = guide {
                self.guide = guide
                print("xxx\(self.guide)")
                self.guidNameTF.text = name ?? ""
                self.guides = id ?? ""

                self.textEnabeld()
            }
        }
        
    }
    
    @objc private func handleRefreshDrivers() {
        API_SuperVisour.getDriver(bus_id: bus){ (error: Error?, drivers: [superViserDriver]?,id,name) in
            if let drivers = drivers {
                self.drivers = drivers
                print("xxx\(self.drivers)")
                self.textEnabeld()
                self.driverNameTF.text = name ?? ""
                self.driverID = id ?? ""
                self.getCarier()
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
    
    @objc private func getCarier(){
        API_SuperVisour.getCarrier(driver_id: driverID){ (error: Error?, id, name,stutus) in
            if stutus == true{
                self.stutse.text = name ?? ""
                self.stutse.isEnabled = false
                self.careeID = id ?? ""
                self.getPrice()
            }else {
                
            }
        }
    }
    
    @objc private func getPrice(){
        API_SuperVisour.getPrice(carrier_id: careeID, path_id: members){ (error: Error?, data,stutus) in
            if stutus == true{
                self.price.text = data ?? ""
                self.price.isEnabled = false
                self.prices = data ?? ""
            }else {
                
            }
        }
    }

    
    @objc private func handleRefreshBuss() {
        API_SuperVisour.getBus{(error: Error?, buss: [superViserBus]?) in
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
        handleRefreshDrivers()
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
    
    func createmeStatusPiker(){
        ReadTheStuts()
        let stutesPiker = UIPickerView()
        stutesPiker.delegate = self
        stutesPiker.dataSource = self
        stutesPiker.tag = 4
        stutse.inputView = stutesPiker
    }
    
    @IBAction func switchAction(_ sender: Any) {
        switch statesSwitch.selectedSegmentIndex {
        case 0:
            self.states = "7"
        case 1:
            self.states = "1"
           
        default:
            break;
        }
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
        let compay = helper.getAPIToken().companyId ?? ""
        
        API_SuperVisour.addTrib(name_en: nameEn , name_ar: nameAr, guide_id: guides, driver_id: driverID, bus_id: bus, start_date: startTim, end_date: endTimes, path_id: members, company_id: compay, price: prices, status: states,number_passenger: numberOfpassange.text ?? "", start_time: startTimeTF.text ?? "", end_time: endTimeTF.text ?? "",carrier_id: careeID){ (error: Error?, success, data,stutus) in
            if success {
                if stutus == true{
                    let title = NSLocalizedString("اضافه رحله", comment: "profuct list lang")
                    self.showAlert(title: title, message: data ?? "")
                }else {
                    let title = NSLocalizedString("اضافه رحله", comment: "profuct list lang")
                    self.showAlert(title: title, message: data ?? "")
                }
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
        }else if pickerView.tag == 3 {
            return guide.count
        }else {
            return stute.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0{
            return buss[row].name
        }else if pickerView.tag == 1{
            return member[row].name
        }else if pickerView.tag == 2 {
            return drivers[row].name
        }else if pickerView.tag == 3{
            return guide[row].name
        }else {
            return stute[row].name
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            busNumTF.text = buss[row].name
            bus = buss[row].id
            createmeGuidePiker()
            createmeDriversPiker()
            getCarier()
            self.view.endEditing(false)
        }else if pickerView.tag == 1{
            memberNameTF.text = member[row].name
            members = member[row].id
            //price = member[row].price
            getPrice()
            self.view.endEditing(false)
        }else if pickerView.tag == 2 {
            driverNameTF.text = drivers[row].name
            driverID = drivers[row].id
            //createBussPiker()
            getCarier()
            self.view.endEditing(false)
            
        }else if pickerView.tag == 3{
            guidNameTF.text = guide[row].name
            guides = guide[row].id
            self.view.endEditing(false)
        }else {
            stutse.text = stute[row].name
            selectedStutes = stute[row].id ?? ""
            self.view.endEditing(false)
        }
    }
}

