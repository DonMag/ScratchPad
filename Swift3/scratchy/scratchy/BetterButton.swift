//
//  BetterButton.swift
//  scratchy
//
//  Created by Don Mag on 3/2/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class BetterButton: UIButton {

	required public init?(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder)
		
//		self.titleLabel!.font = UIFont(name: "Marker Comp", size: 200)
		self.titleLabel!.font = UIFont(name: "Marker Felt", size: 200)
		self.titleLabel?.minimumScaleFactor = 0.01
		self.titleLabel?.numberOfLines = 0
		self.titleLabel?.adjustsFontSizeToFitWidth = true
		self.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
		
		self.layer.cornerRadius = 4
		self.layer.shadowOpacity = 1
		self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		self.layer.shadowRadius = 0
		self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
		
	}

}
