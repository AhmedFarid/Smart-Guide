//
//  notifactionVC.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class notifactionCell: UITableViewCell {

    @IBOutlet weak var superVisorName: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var guidName: UILabel!
    @IBOutlet weak var headMassege: UILabel!
    @IBOutlet weak var message: UILabel!
    
    
    func configuerCell(prodect: notifacations) {
    
        superVisorName.text = "اسم المشرف \(prodect.supervisorName ?? "")"
        driverName.text = "اسم السوائق \(prodect.driverName ?? "")"
        guidName.text = "اسم المرشد \(prodect.guideName ?? "")"
        headMassege.text = "عنوان الرساله \(prodect.headings ?? "")"
        message.text = "الرساله \(prodect.message ?? "")"
    }
    
}
