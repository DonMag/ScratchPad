
//import Foundation
import UIKit
import PlaygroundSupport

var screenSize = CGSize(width: 1920, height: 1080)

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
containerView.backgroundColor = UIColor.green


func chopImageFromRect(image: UIImage, newRect: CGRect) -> UIImage {
	let img = CIImage(image: image)!.cropping(to: newRect)
	let image = UIImage(ciImage: img, scale: 1.0, orientation: image.imageOrientation)
	return image
}

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


var finalImage: UIImage?

// original image size is 2048 x 768
let image2S = UIImage(named: "orig2048x768.png")

// target image size should be 3840 x 1080
let targetImageSize = CGSize(width: screenSize.width * 2.0, height: screenSize.height)

if let sz = image2S?.size {
	
	// get the left side - x: 0 y: 0 / 1024 x 768 - of image
	let leftHalf = chopImageFromRect(image: image2S!, newRect: CGRect(x: 0, y: 0, width: sz.width / 2, height: sz.height))
	
	// get the right side - x: 1024 y: 0 / 1024 x 768 - of image
	let rightHalf = chopImageFromRect(image: image2S!, newRect: CGRect(x: sz.width / 2, y: 0, width: sz.width / 2, height: sz.height))
	
	// target size for each is Half of the Target Image Size (double the screen width x the screen height)
	let targetHalfSize = CGSize(width: targetImageSize.width / 2, height: targetImageSize.height)
	
	// scale each half to targetHalfSize
	let newLH = resizeLONGImage(image: leftHalf, newSize: targetHalfSize)
	let newRH = resizeLONGImage(image: rightHalf, newSize: targetHalfSize)
	
	// combine the two newly-scaled halfs
	finalImage = combine2LONGImage(imageUn: newLH, imageDeux: newRH)
	
	// create an UIImageView the same size as the screen
	let imgView = UIImageView(frame: containerView.bounds)
	
	// set contentMode to .left
	imgView.contentMode = .left
	
	// set the image of the image view
	imgView.image = finalImage
	
	// add the image view to the screen
	containerView.addSubview(imgView)
	
}


PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true


//if let sz = image2S?.size {
//
//	let leftHalf = chopImageFromRect(image: image2S!, newRect: CGRect(x: 0, y: 0, width: sz.width / 2, height: sz.height))
//
//	let rightHalf = chopImageFromRect(image: image2S!, newRect: CGRect(x: sz.width / 2, y: 0, width: sz.width / 2, height: sz.height))
//
//	let targetHalfSize = CGSize(width: targetImageSize.width / 2, height: targetImageSize.height)
//
//	let newLH = resizeLONGImage(image: leftHalf, newSize: targetHalfSize)
//	let newRH = resizeLONGImage(image: rightHalf, newSize: targetHalfSize)
//
//	finalImage = combine2LONGImage(imageUn: newLH, imageDeux: newRH)
//
//}


//let blueImage = UIImage(named: "swiftBlue.png")
//let greenImage = UIImage(named: "swiftGreen.png")
//
//let leftImage = UIImage(named: "swiftBlue.png")
//let rightImage = UIImage(named: "swiftGreen.png")
//
//let newLeftImage = resizeLONGImage(image: leftImage!, newSize: CGSize(width: container.bounds.width, height: 300))
//let newRightImage = resizeLONGImage(image: rightImage!, newSize: CGSize(width: container.bounds.width, height: 300))
//
//let imgL = chopImageFromRect(image: newLeftImage, newRect: CGRect(x: 0, y: 0, width: 300, height: 300))
//
//let imgR = chopImageFromRect(image: newRightImage, newRect: CGRect(x: 300, y: 0, width: 300, height: 300))
//
//
//
//var superNewImage = combine2LONGImage(imageUn: newLeftImage, imageDeux: newRightImage)
//
//superNewImage = combine2LONGImage(imageUn: imgL, imageDeux: imgR)
//
//
//let imageVL = UIImageView(image: newLeftImage)
//let imageVR = UIImageView(image: newRightImage)
//
//let imageVB = UIImageView(image: newRightImage)
//
//imageVL.translatesAutoresizingMaskIntoConstraints = false
//imageVR.translatesAutoresizingMaskIntoConstraints = false
//imageVB.translatesAutoresizingMaskIntoConstraints = false
//
//container.addSubview(imageVL)
//
//imageVR.frame.origin.y = 300
//
//container.addSubview(imageVR)
//
//imageVB.image = superNewImage
//
//imageVB.frame.origin.y = 600
////imageVB.frame.origin.x = 200
//
//container.addSubview(imageVB)
//


