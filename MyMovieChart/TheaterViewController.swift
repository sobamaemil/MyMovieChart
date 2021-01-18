//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by 심찬영 on 2021/01/15.
//

import UIKit
import MapKit

// 영화관을 지도에 표시

class TheaterViewController: UIViewController {
    var param: NSDictionary!
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        let regionRadius: CLLocationDistance = 100
        
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        self.map.setRegion(coordinateRegion, animated: true)
        
        let point = MKPointAnnotation()
        
        point.coordinate = location
        
        self.map.addAnnotation(point)
        
    }
    
}
