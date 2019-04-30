//
//  historyGiudCell.swift
//  Smart Guide
//
//  Created by Farido on 4/24/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class historyGiudCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var stausImage: UIImageView!
    
    
    func configuerCell(prodect: getRequestPauseTrips) {
        self.name.text = "مسار: \(prodect.from):\(prodect.to)"
        if prodect.status == "3"{
            self.status.text = "تم قبول طلبك"
            stausImage.image = UIImage(named: "Group 168-1")
        }else {
            self.status.text = "تم رفض طلبك"
            stausImage.image = UIImage(named: "Group 170")
        }
    }
}
