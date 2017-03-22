//
//  ClassAC.swift
//  CustomBarButton
//
//  Created by Don Mag on 3/22/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ClassAC: UIViewController, ClassCDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setNavbarButtons()
	}
	
	private func setNavbarButtons() {
		
		let myBarButton = classC()
		
		myBarButton.setup("Press Me AC")
		
		myBarButton.delegate = self
		
		self.navigationItem.rightBarButtonItem = myBarButton
		
	}
	
	func PressedButtonForMethodAC() {
		NSLog("Method AC in Class AC fired!")
	}
}

protocol ClassCDelegate {
	func PressedButtonForMethodAC()
}

class classC: UIBarButtonItem {
	
	var delegate: ClassCDelegate?
	
	func setup(_ title: String) {
		
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
		
		// target is self, selector action is inside self... *that* is where we'll call back to the delegate
		button.addTarget(self, action: #selector(classC.classCTap), for: .touchUpInside)
		
		customView = button
		
	}
	
	func classCTap() {
		NSLog("tap inside ClassC ... call back to delegate method")
		delegate?.PressedButtonForMethodAC()
	}
	
}

