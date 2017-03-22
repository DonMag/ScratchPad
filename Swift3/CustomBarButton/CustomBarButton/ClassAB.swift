//
//  ClassAB.swift
//  CustomBarButton
//
//  Created by Don Mag on 3/22/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ClassAB: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setNavbarButtons()
	}
	
	private func setNavbarButtons() {
		
		let myBarButton = classB()
		
		myBarButton.setup("Press Me AB", #selector(ClassAB.PressedButtonForMethodAB), self)
		
		self.navigationItem.rightBarButtonItem = myBarButton
		
	}
	
	func PressedButtonForMethodAB() {
		NSLog("Method AB in Class AB fired!")
	}

}

class classB: UIBarButtonItem {
	
	func setup(_ title: String, _ selectorAction: Selector, _ target: Any) {
		
		let shadow = NSShadow()
		shadow.shadowColor = UIColor.clear
		
		let attributesNormal = [
			NSForegroundColorAttributeName : UIColor.white,
			NSShadowAttributeName : shadow,
			NSFontAttributeName : UIFont.boldSystemFont(ofSize: 12.0)
		]
		
		let button = UIButton(type: .custom)
		let buttonTitleAttributesNormal = NSAttributedString(string: title, attributes: attributesNormal)
		button.setAttributedTitle(buttonTitleAttributesNormal, for: UIControlState.normal)
		let buttonTextSize = button.intrinsicContentSize
		button.frame = CGRect(x: 0, y: 0, width: buttonTextSize.width, height: buttonTextSize.height)
		
		// my navbar is white...
		button.backgroundColor = UIColor.blue
		
		// target and action both assigned by the creator (in this case, ClassAB)
		button.addTarget(target, action: selectorAction, for: .touchUpInside)
		
		customView = button
		
	}
	
}

