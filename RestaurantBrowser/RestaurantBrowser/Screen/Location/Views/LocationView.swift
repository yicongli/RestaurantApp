//
//  LocationView.swift
//  RestaurantBrowser
//
//  Created by Yicong Li on 11/5/19.
//  Copyright © 2019 Yicong Li. All rights reserved.
//

import UIKit

@IBDesignable class LocationView: BaseView {

    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    
    /// Delegate function for handling tap allow action
    var didTapAllow: (() -> Void)?
    /// Delegate function for handling tap deny action
    var didTapDeny: (() -> Void)?

    
    /// Response allow button
    ///
    /// - Parameter sender: UIButton object
    @IBAction func allowAction(_ sender: UIButton) {
        didTapAllow?()
    }
    
    
    /// Response deny button
    ///
    /// - Parameter sender: UIButton object
    @IBAction func denyAction(_ sender: UIButton) {
        didTapDeny?()
    }
}
