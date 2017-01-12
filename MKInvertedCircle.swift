//
//  MKIntertedCircle.swift
//
//  Created by Dario Pellegrini on 12/01/2017.
//

import Foundation
import MapKit

class MKInvertedCircle : NSObject, MKOverlay {

    var coordinate: CLLocationCoordinate2D
    
    var boundingMapRect: MKMapRect {
        return MKMapRectWorld
    }
    
    init(center coord: CLLocationCoordinate2D) {
        self.coordinate = coord
    }
}
