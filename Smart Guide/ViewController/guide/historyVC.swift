//
//  historyVC.swift
//  Smart Guide
//
//  Created by Farido on 4/24/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class historyVC: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    var requestsHistory = [getRequestPauseTrips]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        handleRefreshHomeTrips()
    }
    
    @objc private func handleRefreshHomeTrips() {
        API_Guide.getRequestPauseTrip(urls: URLs.getRequestPauseTripGuide){ (error: Error?, requestsHistory: [getRequestPauseTrips]?) in
            if let requestsHistory = requestsHistory {
                self.requestsHistory = requestsHistory
                print("xxx\(self.requestsHistory)")
                self.tabelView.reloadData()
            }
        }
        
    }
}

extension historyVC: UITableViewDelegate ,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requestsHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? historyGiudCell{
            let trips = requestsHistory[indexPath.row]
            cell.configuerCell(prodect: trips)
            return cell
        }else {
            return historyGiudCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? tripePuseVC{
            if let sub = sender as? getRequestPauseTrips{
                destaiantion.singleItem = sub
            }
        }
    }
}
