//
//  dateVC.swift
//  Smart Guide
//
//  Created by Farido on 4/18/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class dateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func old(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: "old")
    }
    
    
    @IBAction func new(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: "new")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? resultsVC{
            destaiantion.tripID = sender as! String
            destaiantion.url = URLs.main + "filterByDate"
        }
    }
    
}
