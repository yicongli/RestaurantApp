//
//  BaseView.swift
//  RestaurantBrowser
//
//  Created by Yicong Li on 11/5/19.
//  Copyright © 2019 Yicong Li. All rights reserved.
//

import UIKit

@IBDesignable class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure() {
        
    }
}

