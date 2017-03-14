//
//  CustomHeaderView.swift
//  scratchy
//
//  Created by Don Mag on 3/14/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class CustomHeaderView: UIView {
	
	@IBOutlet weak var theLabel: UILabel!

	
	override func layoutSubviews() {
		super.layoutSubviews()
		theLabel.preferredMaxLayoutWidth = theLabel.bounds.width
	}
	
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
