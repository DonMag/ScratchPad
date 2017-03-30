//: [Previous](@previous)

import Foundation
import UIKit
//import PlaygroundSupport
import XCPlayground

var str = "Hello, playground"

//: [Next](@next)

class SwitchViewController : UIViewController {
	var hasInternet = true
	var switchy: UISwitch = UISwitch()
	var previousState = true
	
	var lstr = 0
	
	override func loadView() {
		
		// UI
		
		let view = UIView()
		view.backgroundColor = UIColor.redColor()
		view.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
		
		switchy.on = true
		
		view.addSubview(switchy)
		
		self.switchy.addTarget(self, action: #selector(stateChanged(_:)), forControlEvents: .ValueChanged)
		
		// Layout
		
//		switchy.translatesAutoresizingMaskIntoConstraints = false
		
		self.switchy.center = CGPoint(x: 100, y: 100)
		
//		NSLayoutConstraint.activate([
//			switchy.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
//			switchy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//			])
		
		self.view = view
	}
	
	func stateChanged(switchy: UISwitch) {
		print("Hey switch! ", switchy.on)
		
		lstr = lstr + 1
		
		print("now: ", lstr)
		
		if (!self.hasInternet) {
			print("hey there's no internet, dummy")
			switchy.on = self.previousState
		}
	}

	func stateChanged(inetswitchy: UISwitch) {

	}
	
}

let vc = SwitchViewController()
vc.hasInternet = true



XCPlaygroundPage.currentPage.liveView = vc
//XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


