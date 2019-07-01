//
//  menuVC.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import Kingfisher

class menuVC: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var oldGuidTrips: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if helper.getAPIToken().role == "guides"{
            oldGuidTrips.isHidden = false
        }else {
            oldGuidTrips.isHidden = true
        }
        
        if helper.getAPIToken().role == "members"{
            oldGuidTrips.isHidden = true
        }else {
            oldGuidTrips.isHidden = true
        }
        
        
        
        name.text = "الاسم: \(helper.getAPIToken().name ?? "")"
        phone.text = "الهاتف: \(helper.getAPIToken().phone ?? "")"
        
        
        
        
        self.imageProfile.image = UIImage(named: "3")
        let s = "http://omelqoura.com/\(helper.getAPIToken().image ?? "")"
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        self.imageProfile.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            self.imageProfile.kf.setImage(with: url)
            imageProfile.setRounded()
        }
    }
    
    
    @IBAction func oldTripsBTN(_ sender: Any) {
    }
    @IBAction func logoutBtN(_ sender: Any) {
        helper.dleteAPIToken()
    }
    
}


extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
