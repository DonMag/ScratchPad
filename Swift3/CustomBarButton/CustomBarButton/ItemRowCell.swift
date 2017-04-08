//
//  ItemRowCell.swift
//  CustomBarButton
//
//  Created by Don Mini on 4/7/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ItemRowCell: UITableViewCell {
	@IBOutlet weak var itemDescription: UILabel!
	@IBOutlet weak var quantity: UITextField!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
