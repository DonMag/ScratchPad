//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

var str = "Hello, playground"

//: [Next](@next)

class MyController: UIViewController {
	override func viewDidLoad() {
		self.addButtons()
		
		super.viewDidLoad()
	}
	
	func addButtons() {
		
		//let v = UIView(frame: CGRect(x: 20, y: 20, width: 200, height: 100))
		let v = UIButton(type: .custom)
		v.translatesAutoresizingMaskIntoConstraints = false
		v.backgroundColor = UIColor.red
		v.setTitle("ABC", for: UIControlState())
		self.view.addSubview(v)
		
		let svLeft = NSLayoutConstraint(
			item: v,
			attribute: .left,
			relatedBy: .equal,
			toItem: self.view,
			attribute: .left,
			multiplier: 1.0,
			constant: 20.0)
		
		let svTop = NSLayoutConstraint(
			item: v,
			attribute: .top,
			relatedBy: .equal,
			toItem: self.view,
			attribute: .top,
			multiplier: 1.0,
			constant: 20.0)
		
		let svRight = NSLayoutConstraint(
			item: v,
			attribute: .right,
			relatedBy: .equal,
			toItem: self.view,
			attribute: .right,
			multiplier: 1.0,
			constant: 0.0)
		
		let svBottom = NSLayoutConstraint(
			item: v,
			attribute: .bottom,
			relatedBy: .equal,
			toItem: self.view,
			attribute: .bottom,
			multiplier: 1.0,
			constant: 40.0)

		let svW = NSLayoutConstraint(
			item: v,
			attribute: .width,
			relatedBy: .equal,
			toItem: nil,
			attribute: .notAnAttribute,
			multiplier: 1.0,
			constant: 120.0)
		
		let svH = NSLayoutConstraint(
			item: v,
			attribute: .height,
			relatedBy: .equal,
			toItem: nil,
			attribute: .notAnAttribute,
			multiplier: 1.0,
			constant: 60.0)
		

//		self.view.addConstraints([svLeft, svTop, svRight, svBottom])
		self.view.addConstraints([svLeft, svTop, svW, svH])

		let cancelButton = UIButton(type: .custom)
		let validateButton = UIButton(type: .custom)
		
//		cancelButton.setImage(UIImage(named: "cancel_icon"), for: .normal)
//		validateButton.setImage(UIImage(named: "validate_icon"), for: .normal)
		
//		cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
//		validateButton.addTarget(self, action: #selector(validateAction), for: .touchUpInside)
		
		cancelButton.translatesAutoresizingMaskIntoConstraints = false
		validateButton.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(cancelButton)
		self.view.addSubview(validateButton)
		
		let leftCancel = NSLayoutConstraint(
			item: cancelButton,
			attribute: .left,
			relatedBy: .equal,
			toItem: self.view,
			attribute: .left,
			multiplier: 1,
			constant: 16.0)
		let bottomCancel = NSLayoutConstraint(
			item: cancelButton,
			attribute: .bottom,
			relatedBy: .equal,
			toItem: self.view,
			attribute: .bottom,
			multiplier: 1,
			constant: 20.0)
		let widthCancel = NSLayoutConstraint(
			item: cancelButton,
			attribute: .width,
			relatedBy: .equal,
			toItem: nil,
			attribute: .notAnAttribute,
			multiplier: 1,
			constant: 120.0)
		let heightCancel = NSLayoutConstraint(
			item: cancelButton,
			attribute: .height,
			relatedBy: .equal,
			toItem: nil,
			attribute: .notAnAttribute,
			multiplier: 1,
			constant: 20.0)
		
		let rightValidate = NSLayoutConstraint(item: validateButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 16)
		let bottomValidate = NSLayoutConstraint(item: validateButton, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 20)
		let widthValidate = NSLayoutConstraint(item: validateButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 120)
		let heightValidate = NSLayoutConstraint(item: validateButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
		
//		NSLayoutConstraint.activate([leftCancel, bottomCancel, rightValidate, bottomValidate, widthCancel, heightCancel, widthValidate, heightValidate])

		self.view.addConstraints([leftCancel, bottomCancel, widthCancel, heightCancel])

		self.view.addConstraints([rightValidate, bottomValidate, widthValidate, heightValidate])
		
//		self.view.addConstraints([leftCancel, bottomCancel, rightValidate, bottomValidate, widthCancel, heightCancel, widthValidate, heightValidate])

		cancelButton.backgroundColor = UIColor.cyan
		validateButton.backgroundColor = UIColor.green
		
		self.view.layoutIfNeeded()
	}
	
	func cancelAction() {
		self.dismiss(animated: true, completion: nil)
	}
	
	func validateAction() {
		self.dismiss(animated: true, completion: nil)
	}
}

let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
//
container.backgroundColor = UIColor.green

let vc = MyController()
//vc.view.frame = CGRect(x: 0, y: 0, width: 600, height: 400)
vc.view.backgroundColor = UIColor.yellow

container.addSubview(vc.view)

PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true
