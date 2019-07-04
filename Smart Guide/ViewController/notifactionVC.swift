//
//  notifactionVC.swift
//  Smart Guide
//
//  Created by Farido on 4/23/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class notifactionVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var notifaction = [notifacations]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        handleRefreshHomeTrips()
    }
    
    @objc private func handleRefreshHomeTrips() {
        API_Notifications.notifications{ (error: Error?, notifaction: [notifacations]?) in
            if let notifaction = notifaction {
                self.notifaction = notifaction
                print("xxx\(self.notifaction)")
                self.tableView.reloadData()
            }
        }
        
    }
}

extension notifactionVC: UITableViewDelegate ,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? notifactionCell{
            let trips = notifaction[indexPath.row]
            cell.configuerCell(prodect: trips)
            return cell
        }else {
            return notifactionCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: notifaction[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? notifactionDetialsVC{
            if let sub = sender as? notifacations{
                destaiantion.singleItem = sub
            }
        }
    }
}
