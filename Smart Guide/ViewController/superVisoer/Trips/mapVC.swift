//
//  mapVC.swift
//  Smart Guide
//
//  Created by Farido on 4/21/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class customPin: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var id: Int?
    
    init(pinTitle: String, pinSubTitle: String, location: CLLocationCoordinate2D, Id: Int) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
        self.id = Id
    }
    
}

class mapVC: UIViewController {
    
    var singleItem: trips?
    var singleItems: guidesTrips?
    var tripID = ""
    var speed = ""
    var status = ""
    var startLat = ""
    var startLng = ""
    var endLat = ""
    var endLng = ""
    
    @IBOutlet weak var mapVC: MKMapView!
    var annotation = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()
        mapVC.delegate = self
        
        
        if helper.getAPIToken().role == "supervisors"{
            tripID = singleItem?.tripId ?? ""
            startLat = singleItem?.latStart ?? ""
            startLng = singleItem?.lngStart ?? ""
            endLat = singleItem?.latEnd ?? ""
            endLng = singleItem?.lngEnd ?? ""
        }else {
            tripID = singleItems?.tripId ?? ""
            startLat = singleItems?.latStart ?? ""
            startLng = singleItems?.lngStart ?? ""
            endLat = singleItems?.latEnd ?? ""
            endLng = singleItems?.lngEnd ?? ""
        }
        bus()
        
        print(endLng)
        drowRoute()
    }
    
   
    func drowRoute() {
        let sourceLocation = CLLocationCoordinate2D(latitude: Double(startLat) ?? 0.0, longitude: Double(startLng) ?? 0.0)
        let destinationLocation = CLLocationCoordinate2D(latitude: Double(endLat) ?? 0.0, longitude: Double(endLng) ?? 0.0)
        let sourcePin = customPin(pinTitle: "بداية الرحله", pinSubTitle: "", location: sourceLocation,Id: 2)
        let destinationPin = customPin(pinTitle: "نهايه الرحله", pinSubTitle: "", location: destinationLocation,Id: 3)
        
        self.mapVC.addAnnotation(sourcePin)
        self.mapVC.addAnnotation(destinationPin)
        
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        let dstinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
        
        
        let directionRequset = MKDirections.Request()
        directionRequset.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequset.destination = MKMapItem(placemark: dstinationPlaceMark)
        directionRequset.transportType = .any
        let directions = MKDirections(request: directionRequset)
        directions.calculate { (responese, error) in
            guard let directionResponse = responese else {
                if let error = error{
                    self.showAlert(title: "مسار الحافله", message: "لا يوجد مسار")
                    print("sssssss\(error.localizedDescription)")
                }
                
                return
            }
            
            let route = directionResponse.routes[0]
            self.mapVC.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.mapVC.setRegion(MKCoordinateRegion(rect), animated: true)
            self.mapVC.delegate = self
        }
    }
    
    
    
    fileprivate func bus(){
        let ref = Database.database().reference().child("buses/\(helper.getAPIToken().companyId ?? "")/\(self.tripID)")    
        print(ref)
        ref.observe(.value) { (snapshot: DataSnapshot) in
            if let data = snapshot.value as? [String:AnyObject]{
                if let speed = data["speed"] as? Int,let status = data["status"] as? String,let lat = data["lat"] as? String, let lng = data["lng"] as? String{
                    print(speed)
                    self.speed = "\(speed)"
                    self.status = status
                    print("xxxxxxx\(lat)")
                    //////////////
                    /////////////
                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    let lat = CLLocationDegrees(lat)
                    let long = CLLocationDegrees(lng)
                    let center = CLLocationCoordinate2D(latitude: lat ?? 0.0, longitude: long ?? 0.0)
                    let region = MKCoordinateRegion(center: center, span: span)
                    self.mapVC.setRegion(region, animated: true)
                    ////////
                    ///////
                    
                    
                    self.mapVC.removeAnnotation(self.annotation)
                    //let busLocation = customPin(pinTitle: , pinSubTitle: , location: center,Id: 1)
                    self.annotation.coordinate = center
                    self.annotation.title = "bus speed: \(speed)"
                    self.annotation.subtitle = "status: \(status)"
                    self.mapVC.addAnnotation(self.annotation)
                }
            }
        }
        //refbus.removeAllObservers()
        
    }
}


extension mapVC: MKMapViewDelegate {
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolylineRenderer(overlay: overlay)
        
        renderer.strokeColor = UIColor(red: 17.0/255.0, green: 147.0/255.0, blue: 255.0/255.0, alpha: 1)
        
        renderer.lineWidth = 5.0
        
        return renderer
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        if annotation is MKUserLocation {
            return nil
        }
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        if let location = annotation as? customPin {
            switch(location.id) {
            case 1: // Other
                annotationView?.image = UIImage(named: "Group 168")
                break;
            case 2: // sports
                annotationView?.image = UIImage(named: "hotel")
                break;
            case 3: // education
                annotationView?.image = UIImage(named: "mecca")
            default:
                break;
            }
        }else {
            annotationView?.image = UIImage(named: "Group 168")
        }
        annotationView?.canShowCallout = true
        return annotationView
    }
    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let renderer = MKPolylineRenderer(overlay: overlay)
//        renderer.strokeColor = UIColor.blue
//        renderer.lineWidth = 4.0
//        return renderer
//    }
    
    
}
