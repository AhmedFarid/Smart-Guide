//
//  requestesCell.swift
//  Smart Guide
//
//  Created by Farido on 4/24/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class requestesCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    
    
    func configuerCell(prodect: getRequestPauseTrips) {
        self.name.text = "مسار: \(prodect.from):\(prodect.to)"
        self.status.text = "طلب تعليق"
    }
}
