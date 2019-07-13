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
    @IBOutlet weak var pathName: UILabel!
    
    func configuerCell(prodect: drivers) {
        
        
        name.text = prodect.tripName
        statues.text = prodect.status
        pathName.text = "\(prodect.from):\(prodect.to)"
    }
}
