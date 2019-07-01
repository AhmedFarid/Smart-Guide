//
//  memberSuperVisorVM.swift
//  Smart Guide
//
//  Created by Farido on 6/26/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class memberSuperVisorVM: UIViewController {
    
    var superVisorsss = [superVisorss]()
    
    @IBOutlet weak var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        handleRefreshHomesuperVisors()
        tabelView.delegate = self
        tabelView.dataSource = self
        
    }
    
    @objc private func handleRefreshHomesuperVisors() {
        
        API_Members.getSuperVisor{ (error: Error?, superVisorsss: [superVisorss]?) in
            if let superVisorsss = superVisorsss {
                self.superVisorsss = superVisorsss
                print("xxx\(self.superVisorsss)")
                self.tabelView.reloadData()
            }
        }
        
    }
    
}

extension memberSuperVisorVM: UITableViewDelegate ,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superVisorsss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? memberSupervisorCell{
            let trips = superVisorsss[indexPath.row]
            cell.configuerCell(prodect: trips)
            return cell
        }else {
            return memberSupervisorCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: superVisorsss[indexPath.row])
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destaiantion = segue.destination as? homeMemberVC{
                if let sub = sender as? superVisorss{
                    destaiantion.singeleItem = sub
                }
            }
        }
}



