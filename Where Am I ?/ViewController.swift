//
//  ViewController.swift
//  Where Am I ?
//
//  Created by Rafael Goncalves on 26/05/2018.
//  Copyright © 2018 BlessCode. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

   
    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        /*
        let latitude: CLLocationDegrees = -23.534970
        let longitude: CLLocationDegrees = -46.635275
        let deltaLatitude: CLLocationDegrees = 0.02
        let deltaLongitude: CLLocationDegrees = 0.02
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualization: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, areaVisualization)
        
        map.setRegion(region , animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Museu"
        annotation.subtitle = "onde estava"
        
        map.addAnnotation(annotation)*/
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse{
            var alertController = UIAlertController(title: "Location permission", message: "Authorizaion required for access your location", preferredStyle: .alert)
            
            var configurationAction = UIAlertAction(title: "Open Configuration", style: .default, handler: { (configurationAction) in
                
                if let configurations = NSURL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.open(configurations as URL)
                }
            })
            
            var cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alertController.addAction(configurationAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations.last!
        
        //monta exibição do mapa
        let latitude: CLLocationDegrees = userLocation.coordinate.latitude
        let longitude: CLLocationDegrees = userLocation.coordinate.longitude
        let deltaLatitude: CLLocationDegrees = 0.02
        let deltaLongitude: CLLocationDegrees = 0.02
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaVisualization: MKCoordinateSpan = MKCoordinateSpanMake(deltaLatitude, deltaLongitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, areaVisualization)
        
        map.setRegion(region , animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

