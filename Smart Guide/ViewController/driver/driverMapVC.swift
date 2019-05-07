//
//  driverMapVC.swift
//  Smart Guide
//
//  Created by Farido on 4/30/19.
//  Copyright © 2019 farid. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class customPins: NSObject, MKAnnotation{
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

class driverMapVC: UIViewController {
    
    var singleItems: drivers?
    var tripID = ""
    var speed = ""
    var status = ""
    var startLat = ""
    var startLng = ""
    var endLat = ""
    var endLng = ""
    let locationManager = CLLocationManager()
    var userLat = 0.0
    var userLng = 0.0
    
    
    @IBOutlet weak var mapVC: MKMapView!
    var annotation = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        mapVC.delegate = self
        
        tripID = singleItems?.tripId ?? ""
        startLat = singleItems?.latStart ?? ""
        startLng = singleItems?.lngStart ?? ""
        endLat = singleItems?.latEnd ?? ""
        endLng = singleItems?.lngEnd ?? ""
        
        bus()
        getUserLocation()
        print("vvvvv\(endLng)")
        drowRoute()
    }
    
    func getUserLocation(){
        //self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func drowRoute() {
        let sourceLocation = CLLocationCoordinate2D(latitude: Double(startLat) ?? 0.0, longitude: Double(startLng) ?? 0.0)
        let destinationLocation = CLLocationCoordinate2D(latitude: Double(endLat) ?? 0.0, longitude: Double(endLng) ?? 0.0)
        let sourcePin = customPins(pinTitle: "بداية الرحله", pinSubTitle: "", location: sourceLocation,Id: 2)
        let destinationPin = customPins(pinTitle: "نهايه الرحله", pinSubTitle: "", location: destinationLocation,Id: 3)
        
        self.mapVC.addAnnotation(sourcePin)
        self.mapVC.addAnnotation(destinationPin)
        
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation)
        let dstinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
        
        
        let directionRequset = MKDirections.Request()
        directionRequset.source = MKMapItem(placemark: sourcePlaceMark)
        directionRequset.destination = MKMapItem(placemark: dstinationPlaceMark)
        directionRequset.transportType = .automobile
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
    
    
    
     func bus(){
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let lat = CLLocationDegrees(userLat)
        let long = CLLocationDegrees(userLng)
        let center = CLLocationCoordinate2D(latitude: lat , longitude: long )
        let region = MKCoordinateRegion(center: center, span: span)
        self.mapVC.setRegion(region, animated: true)
        self.mapVC.removeAnnotation(self.annotation)
        self.annotation.coordinate = center
        self.mapVC.addAnnotation(self.annotation)
    }
}


extension driverMapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotation is MKUserLocation {
            //let pin = mapView.view(for: annotation) as? MKPinAnnotationView ?? MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.image = UIImage(named: "Group 168")
            //return pin
        }
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        if let location = annotation as? customPins {
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
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
    
}

extension driverMapVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        self.userLat = locValue.latitude
        self.userLng = locValue.longitude
        let ref = Database.database().reference().child("buses/\(helper.getAPIToken().companyId ?? "")/\(self.tripID)")
        ref.child("lat").setValue("\(locValue.latitude)")
        ref.child("lng").setValue("\(locValue.longitude)")
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let lat = CLLocationDegrees(locValue.latitude)
        let long = CLLocationDegrees(locValue.longitude)
        let center = CLLocationCoordinate2D(latitude: lat , longitude: long )
        let region = MKCoordinateRegion(center: center, span: span)
        self.mapVC.setRegion(region, animated: true)
        self.mapVC.removeAnnotation(self.annotation)
        self.annotation.coordinate = center
    }
}
