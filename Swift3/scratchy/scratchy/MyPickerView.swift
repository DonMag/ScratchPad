//
//  MyPickerView.swift
//  scratchy
//
//  Created by Don Mag on 3/15/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class MyPickerView: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.dataSource = self
		self.delegate = self
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		self.dataSource = self
		self.delegate = self
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return 3
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return "Row \(row)"
	}

	
	func pointAboveLine(point: CGPoint, p1: CGPoint, p2: CGPoint) -> Int {
		// first, horizontally sort the points in the line
		var first: CGPoint = CGPoint.zero
		var second: CGPoint = CGPoint.zero

		if p1.x > p2.x {
			first = p2
			second = p1
		} else {
			first = p1
			second = p2
		}

		let v1 = CGPoint(x: second.x - first.x, y: second.y - first.y)
		let v2 = CGPoint(x: second.x - point.x, y: second.y - point.y)
		
		let xp = v1.x * v2.y - v1.y * v2.x
		
		// above
		if (xp > 0) {
			return 1;
		}
			// below
		else if (xp < 0) {
			return -1;
		}
			// exactly on the line
		else {
			return 0;
		}
	}
	

}
