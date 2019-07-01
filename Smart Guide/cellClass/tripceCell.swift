//
//  tripceCell.swift
//  Smart Guide
//
//  Created by Farido on 4/3/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class tripceCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var statues: UILabel!
    
    func configuerCell(prodect: trips) {
        
        
        name.text = prodect.tripName
        statues.text = prodect.status
    }
}
