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
var myImg = MyImage(cgImage: (img?.cgImage)!)

var finalImageSize: CGFloat = 200.0

var w = myImg.size.width
var h = myImg.size.height

if w > h {
	finalImage = myImg.resized(toHeight: finalImageSize)!
} else {
	finalImage = myImg.resized(toWidth: finalImageSize)!
}

let imgView = UIImageView(frame: CGRect(x: 40, y: 280, width: 200, height: 200))
imgView.backgroundColor = UIColor.red
imgView.contentMode = .center
imgView.clipsToBounds = true

imgView.image = finalImage

containerView.addSubview(imgView)

let v = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
v.backgroundColor = UIColor.black

containerView.addSubview(v)

let newImage = UIImage(named: "car.png")
let newImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
newImageView.image = newImage
newImageView.contentMode = .scaleAspectFill
newImageView.layer.cornerRadius = newImageView.frame.width / 2
newImageView.layer.masksToBounds = true

//let maskView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//maskView.layer.cornerRadius = maskView.frame.width / 2
//iv.mask = maskView

containerView.addSubview(newImageView)

PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true
