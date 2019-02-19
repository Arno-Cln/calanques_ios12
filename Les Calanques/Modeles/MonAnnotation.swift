//
//  MonAnnotation.swift
//  Les Calanques
//
//  Created by Arnaud Caillon on 19/02/2019.
//  Copyright © 2019 Arnaud Caillon. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var calanque: Calanque
    var title: String?
    
    init(_ calanque: Calanque) {
        self.calanque = calanque
        coordinate = self.calanque.coordonnée
        title = self.calanque.nom
    }
    
    
    
    
}


