//
//  tripsDriverCell.swift
//  Smart Guide
//
//  Created by Farido on 4/30/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class tripsDriverCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var statues: UILabel!
    
    func configuerCell(prodect: drivers) {
        
        
        name.text = prodect.tripName
        statues.text = prodect.status
    }
}
