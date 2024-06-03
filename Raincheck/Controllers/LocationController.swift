//
//  LocationController.swift
//  Raincheck
//
//  Created by Evan Lokajaya on 30/05/24.
//

import Foundation
import CoreLocation

class LocationController: NSObject, CLLocationManagerDelegate, ObservableObject {
    let locationManager = CLLocationManager()
    
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var isRequestingLocation:Bool = false
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func requstLocation() {
        self.isRequestingLocation = true
        self.locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.userLocation = locations.first?.coordinate
        self.isRequestingLocation = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting location")
        print("\(error.localizedDescription)")
        self.isRequestingLocation = false
    }
}
