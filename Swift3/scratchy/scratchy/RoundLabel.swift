//
//  RoundLabel.swift
//  scratchy
//
//  Created by Don Mag on 3/20/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

@IBDesignable

class RoundLabel: UILabel {

	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		commonInit()
	}
	
	func commonInit() -> Void {
		self.textAlignment = .center
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		
		let cRadius: CGFloat = min(self.bounds.size.height, self.bounds.size.width) / 2.0
		self.layer.cornerRadius = cRadius
		self.layer.masksToBounds = true
		
		self.layer.borderColor = UIColor.blue.cgColor
		self.layer.borderWidth = 1.0

	}
	
}
