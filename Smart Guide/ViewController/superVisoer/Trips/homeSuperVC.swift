//
//  homeSuperVC.swift
//  Smart Guide
//
//  Created by Farido on 4/3/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit

class homeSuperVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var trip = [trips]()
    var tripID = "1"
    
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
        API_SuperVisour.getTrip(type: tripID){ (error: Error?, trip: [trips]?) in
            if let trip = trip {
                self.trip = trip
                print("xxx\(self.trip)")
                self.collectionView.reloadData()
            }
        }
        
    }
}



extension homeSuperVC: UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trip.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? tripceCell{
            let trips = trip[indexPath.row]
            cell.configuerCell(prodect: trips)
            return cell
        }else {
            return tripceCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ccccc")
        performSegue(withIdentifier: "suge", sender: trip[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destaiantion = segue.destination as? detialsTripVC{
            if let sub = sender as? trips{
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

