//
//  LayeredIcon.swift
//  scratchy
//
//  Created by Don Mini on 4/8/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

//extension UIColor {
//	
//	convenience init(red: Int, green: Int, blue: Int) {
//		assert(red >= 0 && red <= 255, "Invalid red component")
//		assert(green >= 0 && green <= 255, "Invalid green component")
//		assert(blue >= 0 && blue <= 255, "Invalid blue component")
//		
//		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//	}
//	
//	convenience init(rgb: Int) {
//		self.init(
//			red: (rgb >> 16) & 0xFF,
//			green: (rgb >> 8) & 0xFF,
//			blue: rgb & 0xFF
//		)
//	}
//	
//	func lighter(by percentage:CGFloat=30.0) -> UIColor? {
//		return self.adjust(by: abs(percentage) )
//	}
//	
//	func darker(by percentage:CGFloat=30.0) -> UIColor? {
//		return self.adjust(by: -1 * abs(percentage) )
//	}
//	
//	func adjust(by percentage:CGFloat=30.0) -> UIColor? {
//		var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
//		if(self.getRed(&r, green: &g, blue: &b, alpha: &a)){
//			return UIColor(red: min(r + percentage/100, 1.0),
//			               green: min(g + percentage/100, 1.0),
//			               blue: min(b + percentage/100, 1.0),
//			               alpha: a)
//		}else{
//			return nil
//		}
//	}
//}
//
class LayeredIcon: UIView {

	func myInit(rgb: Int) -> Void {
		
		let c = UIColor(rgb: rgb)

		self.myInit(cColor: c.adjust(by: 50)!, pColor: c, tColor: c.adjust(by: 80)!)
		
	}
	
	func myInit(cColor: UIColor, pColor: UIColor, tColor: UIColor) -> Void {
		
		let cTemplate = UIImage(named: "CircleTemplate")
		let pTemplate = UIImage(named: "PeopleTemplate")
		let tTemplate = UIImage(named: "TieTemplate")
		
		// generate colored images from templates
		let cImage = cTemplate?.imageWithColor(color: cColor)
		let pImage = pTemplate?.imageWithColor(color: pColor)
		let tImage = tTemplate?.imageWithColor(color: tColor)
		
		let c = UIImageView(image: cImage)
		let p = UIImageView(image: pImage)
		let t = UIImageView(image: tImage)
		
		self.addSubview(c)
		self.addSubview(p)
		self.addSubview(t)

	}
	
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
