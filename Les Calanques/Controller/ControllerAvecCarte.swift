//
//  ControllerAvecCarte.swift
//  Les Calanques
//
//  Created by Arnaud Caillon on 14/02/2019.
//  Copyright © 2019 Arnaud Caillon. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: mapView.mapType = MKMapType.standard
        case 1: mapView.mapType = MKMapType.satellite
        case 2: mapView.mapType = MKMapType.hybrid
        default: break
        }
    }
    
    @IBAction func getPosition(_ sender: Any) {
    }
    

    

}
