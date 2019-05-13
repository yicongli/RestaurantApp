//
//  AppDelegate.swift
//  RestaurantBrowser
//
//  Created by Yicong Li on 10/5/19.
//  Copyright © 2019 Yicong Li. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow() // The main window
    let locationService = LocationServices() // the manager for handling location service
    let storyBoard = UIStoryboard(name: "Main", bundle: nil) // get the UI from story borad


    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // check the service status first and show different views
        switch locationService.status {
        case .notDetermined, .restricted, .denied:
            // if there is no access to the location service, then show the location enqury view
            let locationViewControllor = storyBoard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
            locationViewControllor?.locationService = locationService
            window.rootViewController = locationViewControllor
        default:
            assertionFailure()
        }
        
        // show the main window
        window.makeKeyAndVisible()
        
        return true
    }


}

