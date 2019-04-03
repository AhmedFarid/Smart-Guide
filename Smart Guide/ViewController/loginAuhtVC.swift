//
//  ViewController.swift
//  Smart Guide
//
//  Created by farid on 3/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class loginAuhtVC: UIViewController {
    
    @IBOutlet weak var userNameTF: roundedTF!
    @IBOutlet weak var passwordTF: roundedTF!
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageText()
        
    }
    
    @IBAction func getpassword(_ sender: Any) {
        passwordTF.isSecureTextEntry.toggle()
    }
    
    
    func imageText() {
        
        if let myImage = UIImage(named: "Union 1"){
            
            userNameTF.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "Path 3762"){
            
            passwordTF.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    
    @IBAction func login(_ sender: Any) {
        guard let userName = userNameTF.text, !userName.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwords = passwordTF.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        API_AUTH.login(email: userName , password: passwords) { (error: Error?, success: Bool, data) in
            if success {
                if data == nil {
                    print("success")
                }else {
                    self.showAlert(title: "Login Filed", message: "\(data ?? "")")
                }
                //
            }else {
                self.showAlert(title: "Login Filed", message: "\(data ?? "")")
            }
            
        }
    }
}

