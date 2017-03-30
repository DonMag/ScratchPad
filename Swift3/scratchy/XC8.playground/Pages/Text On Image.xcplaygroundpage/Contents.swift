//: [Previous](@previous)

import Foundation

import UIKit
import PlaygroundSupport

var screenSize = CGSize(width: 600, height: 600)

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
containerView.backgroundColor = UIColor.orange
print(UIColor.orange.cgColor)


func combine2LONGImage(imageUn: UIImage, imageDeux: UIImage) -> UIImage {
	
	let size = CGSize(width: imageUn.size.width + imageDeux.size.width, height: imageUn.size.height)
	UIGraphicsBeginImageContext(size)
	
	imageUn.draw(in: CGRect(x: 0, y: 0, width: imageUn.size.width, height: imageUn.size.height))
	
	imageDeux.draw(in: CGRect(x: imageUn.size.width, y: 0, width: imageDeux.size.width, height: imageDeux.size.height))
	
	
	let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
	UIGraphicsEndImageContext()
	return newImage
	
}

func resizeLONGImage(image: UIImage, newSize: CGSize) -> UIImage {
	UIGraphicsBeginImageContext(newSize)
	image.draw(in: CGRect(x:0, y:0, width: newSize.width, height: newSize.height))
	let newImage = UIGraphicsGetImageFromCurrentImageContext()
	UIGraphicsEndImageContext()
	return newImage!
}

func addTextToImage(image: UIImage, str: String, fctr: CGFloat) -> UIImage {
	
	let font = UIFont(name: "Arial", size: 18)
	
	var sz = image.size
	
	sz.width *= fctr
	sz.height *= fctr
	
//	UIGraphicsBeginImageContext(sz)
	UIGraphicsBeginImageContextWithOptions(sz, true, 0.0)
	
	image.draw(in: CGRect(x:0, y:0, width: sz.width, height: sz.height))
	
	let nstr: NSString = str as NSString
	nstr.draw(in: CGRect(x:0, y:0, width: sz.width, height: sz.height), withAttributes: nil)
	
	let newImage = UIGraphicsGetImageFromCurrentImageContext()
	
	UIGraphicsEndImageContext()
	
	return newImage!
	
}


var finalImage: UIImage?

// original image size is 2048 x 768
//let img = UIImage(named: "orig2048x768.png")
//let img = UIImage(named: "pic3264x2050.png")

var img = UIImage(named: "swiftGreen.png")

//img = UIImage(named: "pic3264x2050.png")

// target image size should be 3840 x 1080
let targetImageSize = CGSize(width: screenSize.width * 2.0, height: screenSize.height)

finalImage = addTextToImage(image: img!, str: "Testing 1 2 3", fctr: 1)

let imgView = UIImageView(image: finalImage)

imgView.frame = containerView.frame.insetBy(dx: 80.0, dy: 80.0)

containerView.addSubview(imgView)

PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true
