//
//  LocationService.swift
//  RestaurantBrowser
//
//  Created by Yicong Li on 11/5/19.
//  Copyright © 2019 Yicong Li. All rights reserved.
//

import Foundation
import CoreLocation

enum Result<T> {
    case success(T)
    case failure(Error)
}

final class LocationServices: NSObject {
    private let manager: CLLocationManager
    
    init(manager: CLLocationManager = .init()) {
        self.manager = manager
        super.init()
        manager.delegate = self
    }
    
    var newLocation: ((Result<CLLocation>) -> Void)?
    var didChangeStatus:((Bool) -> Void)?
    
    var status: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
}

extension LocationServices: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        newLocation?(.failure(error))
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.sorted(by: {$0.timestamp > $1.timestamp}).first {
            newLocation?(.success(location))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            didChangeStatus?(false)
        default:
            didChangeStatus?(true)
            <#code#>
        }
    }
}
