//
//  ViewController.swift
//  Where Am I ?
//
//  Created by Rafael Goncalves on 26/05/2018.
//  Copyright © 2018 BlessCode. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude: CLLocationDegrees = -23.534970
        let longitude: CLLocationDegrees = -46.635275
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

