//: [Previous](@previous)

import Foundation

import UIKit
import PlaygroundSupport

var screenSize = CGSize(width: 600, height: 600)

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
containerView.backgroundColor = UIColor.orange


class MyImage: UIImage {
	// Resize image
	
	func resized(withPercentage percentage: CGFloat) -> UIImage? {
		let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
		UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
		defer { UIGraphicsEndImageContext() }
		draw(in: CGRect(origin: .zero, size: canvasSize))
		return UIGraphicsGetImageFromCurrentImageContext()
	}
	
	func resized(toWidth width: CGFloat) -> UIImage? {
		let canvasSize = CGSize(width: width, height: size.height * width / size.width)
		UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
		defer { UIGraphicsEndImageContext() }
		draw(in: CGRect(origin: .zero, size: canvasSize))
		return UIGraphicsGetImageFromCurrentImageContext()
	}
	
	func resized(toHeight height: CGFloat) -> UIImage? {
		let canvasSize = CGSize(width: size.width * height / size.height, height: height)
		UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
		defer { UIGraphicsEndImageContext() }
		draw(in: CGRect(origin: .zero, size: canvasSize))
		return UIGraphicsGetImageFromCurrentImageContext()
	}
	
}

var finalImage = UIImage()

var img = UIImage(named: "car.png")


var r = CGRect(x: 70, y: 180, width: 140, height: 120)

finalImage = UIImage(cgImage: (img?.cgImage?.cropping(to: r))!)

let imgView = UIImageView(image: finalImage)

containerView.addSubview(imgView)


PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true
