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

    let window = UIWindow()
    let locationService = LocationServices()
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)


    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        switch locationService.status {
        case .notDetermined, .restricted, .denied:
            let locationViewControllor = storyBoard.instantiateViewController(withIdentifier: "LocationViewController") as? LocationViewController
            locationViewControllor?.locationService = locationService
            window.rootViewController = locationViewControllor
        default:
            assertionFailure()
        }
        
        window.makeKeyAndVisible()
        
        return true
    }


}

