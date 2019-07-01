//
//  memberSupervisorCell.swift
//  Smart Guide
//
//  Created by Farido on 6/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class memberSupervisorCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    func configuerCell(prodect: superVisorss) {
        
        
        name.text = prodect.name
    }
}



