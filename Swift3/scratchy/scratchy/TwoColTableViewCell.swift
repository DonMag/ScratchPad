//
//  TwoColTableViewCell.swift
//  scratchy
//
//  Created by Don Mag on 4/12/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class TwoColTableViewCell: UITableViewCell {

	@IBOutlet weak var leftLabel: UILabel!
	
	@IBOutlet weak var rightLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
