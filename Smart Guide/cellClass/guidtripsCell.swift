//
//  guidtripsCell.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class guidtripsCell: UICollectionViewCell {
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var statues: UILabel!
    
    func configuerCell(prodect: guidesTrips) {
        
        
        name.text = prodect.tripName
        statues.text = prodect.status
    }
}
