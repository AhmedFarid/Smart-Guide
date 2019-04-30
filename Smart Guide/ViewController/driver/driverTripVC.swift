//
//  ViewController.swift
//  Smart Guide
//
//  Created by Farido on 4/30/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class driverTripVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var trip = [drivers	]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        handleRefreshHomeTrips()
    }
    override func viewWillAppear(_ animated: Bool) {
        handleRefreshHomeTrips()
    }
    
    
    @objc private func handleRefreshHomeTrips() {
        API_Driver.getDriverTrips{ (error: Error?, trip: [drivers]?) in
            if let trip = trip {
                self.trip = trip
                print("xxx\(self.trip)")
                self.collectionView.reloadData()
            }
        }
        
    }
}



extension driverTripVC: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trip.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? tripsDriverCell{
            let trips = trip[indexPath.row]
            cell.configuerCell(prodect: trips)
            return cell
        }else {
            return tripsDriverCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ccccc")
        performSegue(withIdentifier: "suge", sender: trip[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? tripDetilsVC{
            if let sub = sender as? drivers{
                destaiantion.singleItem = sub
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        
        var width = (screenWidth-30)/2
        
        width = width < 130 ? 160 : width
        
        return CGSize.init(width: width, height: width)
    }
    
}

