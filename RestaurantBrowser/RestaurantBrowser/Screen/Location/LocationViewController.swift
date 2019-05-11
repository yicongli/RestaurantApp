//
//  LocationViewController.swift
//  RestaurantBrowser
//
//  Created by Yicong Li on 11/5/19.
//  Copyright © 2019 Yicong Li. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var locationView: LocationView!
    
    var locationService: LocationServices?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationView.didTapAllow = { [weak self] in
            print("Tapped allow")
            self?.locationService?.requestLocationAuthorization()
        }
        
        locationService?.didChangeStatus = {[weak self] success in
            if success {
                self?.locationService?.getLocation()
            }
        }
        
        locationService?.newLocation = {[weak self] result in
            switch result {
            case .success(let location):
                print(location)
            case .failure(let error):
                assertionFailure("Error to get user location \(error)")
            }
        }
    }

}
