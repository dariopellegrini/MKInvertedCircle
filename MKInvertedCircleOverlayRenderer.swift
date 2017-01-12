//
//  MKInvertedCircleOverlayRenderer.swift
//
//  Created by Dario Pellegrini on 12/01/2017.
//

import UIKit

class MKInvertedCircleOverlayRenderer: MKOverlayRenderer {
    var diameter: Double = 0.0
    var fillColor: UIColor = UIColor.clear
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        let path = UIBezierPath(rect: CGRect(x: mapRect.origin.x, y: mapRect.origin.y, width: mapRect.size.width, height: mapRect.size.height))
        let radiusInMap = diameter * MKMapPointsPerMeterAtLatitude(overlay.coordinate.latitude)
        let mapSize: MKMapSize = MKMapSize(width: radiusInMap, height: radiusInMap)
        let regionOrigin = MKMapPointForCoordinate(overlay.coordinate)
        var regionRect: MKMapRect = MKMapRect(origin: regionOrigin, size: mapSize)
        regionRect = MKMapRectOffset(regionRect, -radiusInMap/2, -radiusInMap/2);
        regionRect = MKMapRectIntersection(regionRect, MKMapRectWorld);
        
        let excludePath: UIBezierPath = UIBezierPath(roundedRect: CGRect(x: regionRect.origin.x, y: regionRect.origin.y, width: regionRect.size.width, height: regionRect.size.height), cornerRadius: CGFloat(regionRect.size.width) / 2)
        path.append(excludePath)
        
        context.setFillColor(fillColor.cgColor);
        context.addPath(path.cgPath);
        context.fillPath(using: .evenOdd)
    }
}
