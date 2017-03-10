//
//  SampleView.swift
//  scratchy
//
//  Created by Don Mag on 2/27/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class SampleView: UIView {

	var contentView : UIView!
	
	@IBOutlet weak var theLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		xibSetup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		xibSetup()
	}
	
	func xibSetup() {
		contentView = loadViewFromNib()
		
		contentView.frame = bounds
		
		// Make the view stretch with containing view
		contentView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
		
		// Note: translatesAutoresizingMaskIntoConstraints needs to be TRUE, or we need to explicitly set Constraints
		//	change to false to see the difference...
		contentView.translatesAutoresizingMaskIntoConstraints = true //false
		
		// Adding custom subview on top of our view (over any custom drawing > see note below)
		addSubview(contentView)
		
	}
	
	func loadViewFromNib() -> UIView! {
		
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: "SampleView", bundle: bundle)
		let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
		
		return view
	}

}
