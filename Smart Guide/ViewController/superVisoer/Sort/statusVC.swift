//
//  statusVC.swift
//  Smart Guide
//
//  Created by Farido on 4/18/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class statusVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func a1(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: "1")
    }
    
    @IBAction func a2(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: "2")
    }
    
    @IBAction func a3(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: "3")
    }
    
    @IBAction func a4(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: "4")
    }
    
    @IBAction func a5(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: "5")
    }
    
    @IBAction func a7(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: "6")
    }
    
    @IBAction func a6(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: "7")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let destaiantion = segue.destination as? resultsVC{
                    destaiantion.tripID = sender as! String
                    destaiantion.url = URLs.main + "filterByStatus"
               }
            }
}
