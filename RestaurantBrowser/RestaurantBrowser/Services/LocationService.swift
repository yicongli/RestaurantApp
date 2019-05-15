//
//  LocationService.swift
//  RestaurantBrowser
//
//  Created by Yicong Li on 11/5/19.
//  Copyright © 2019 Yicong Li. All rights reserved.
//
//  Class for providing location service.
//

import Foundation
import CoreLocation


/// The enum type for receiving location result
///
/// - success: success info with location object
/// - failure: failure info with Error
enum Result<T> {
    case success(T)
    case failure(Error)
}


/// The class providing location services.
final class LocationServices: NSObject {
    /// Location manager
    private let manager: CLLocationManager
    
    /// Init with CLLocationManager
    ///
    /// - Parameter manager: CLLocationManager instance with default value
    init(manager: CLLocationManager = .init()) {
        self.manager = manager
        super.init()
        manager.delegate = self
    }
    
    /// a delegate function to handle receiving location result
    var newLocation: ((Result<CLLocation>) -> Void)?
    /// a delegate function to handle location service status has changed
    var didChangeStatus:((Bool) -> Void)?
    
    /// computational property for getting current status
    var status: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    
    /// Reqeust location authorization when user allows
    func requestLocationAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    
    /// get current location
    func getLocation() {
        manager.requestLocation()
    }
}


// MARK: - CLLocationManagerDelegate
extension LocationServices: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // handling error
        newLocation?(.failure(error))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // get current location
        if let location = locations.sorted(by: {$0.timestamp > $1.timestamp}).first {
            newLocation?(.success(location))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // handling status changes
        switch status {
        case .notDetermined, .restricted, .denied:
            didChangeStatus?(false)
        default:
            didChangeStatus?(true)
        }
    }
}
