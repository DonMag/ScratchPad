
import UIKit
import CoreImage
import PlaygroundSupport

public extension UIImage {
	public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
		let rect = CGRect(origin: .zero, size: size)
		UIGraphicsBeginImageContextWithOptions(rect.size, false, 1.0)
		color.setFill()
		UIRectFill(rect)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		guard let cgImage = image?.cgImage else { return nil }
		self.init(cgImage: cgImage)
	}
}

func scaledImage(image: UIImage, w: CGFloat, h: CGFloat) -> UIImage {
	
	var sz = image.size
	sz.width = w
	sz.height = h
	
	let hasAlpha = true
	let scale: CGFloat = image.scale
	
	UIGraphicsBeginImageContextWithOptions(sz, !hasAlpha, scale)
	image.draw(in: CGRect(origin: CGPoint.zero, size: sz))
	
	let newImage = UIGraphicsGetImageFromCurrentImageContext()
	UIGraphicsEndImageContext()
	
	return newImage!

}

func boundedImage(image: UIImage, w: CGFloat, h: CGFloat) -> UIImage {
	
	var imgsz = image.size
	var sz = CGSize(width: w, height: h)
	
	let xoff = (w - imgsz.width) / 2
	let yoff = (h - imgsz.height) / 2
	
	let p = CGPoint(x: xoff, y: yoff)
	
	let hasAlpha = true
	let scale: CGFloat = image.scale
	
	UIGraphicsBeginImageContextWithOptions(sz, !hasAlpha, scale)
	image.draw(in: CGRect(origin: p, size: imgsz))
	
	let newImage = UIGraphicsGetImageFromCurrentImageContext()
	UIGraphicsEndImageContext()
	
	return newImage!
	
}

func maskImage(image:UIImage, mask:UIImage) -> UIImage? {
	
	if let imageReference = image.cgImage {
		if let maskReference = mask.cgImage {
			
			let imageMask = CGImage(
				maskWidth: maskReference.width,
				height: maskReference.height,
				bitsPerComponent: maskReference.bitsPerComponent,
				bitsPerPixel: maskReference.bitsPerPixel,
				bytesPerRow: maskReference.bytesPerRow,
				provider: maskReference.dataProvider!,
				decode: nil,
				shouldInterpolate: true)
			
			let maskedReference = imageReference.masking(imageMask!)
			
			let maskedImage = UIImage(cgImage:maskedReference!)
			
			return maskedImage
			
		}
	}
	
	return nil
}

let cView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
cView.backgroundColor = UIColor.blue
PlaygroundPage.current.liveView = cView

var targImage = UIImage(named: "car")
var drop = UIImage(named: "iconOutline")

drop = UIImage(named: "bwDrop")
drop = UIImage(named: "whiteTranDrop")

let m = maskImage(image: targImage!, mask: drop!)


//targImage = UIImage(color: UIColor.clear, size: CGSize(width: 200, height: 200))

var iv = UIImageView(image: m)
iv.frame = CGRect(x: 10, y: 10, width: (750 / 4), height: 100)
cView.addSubview(iv)

var rd = UIImage(color: .red, size: (drop?.size)!)

let sc = UIImage(cgImage: (drop?.cgImage)!, scale: 0.75, orientation: (drop?.imageOrientation)!)

var m2 = maskImage(image: sc, mask: drop!)

let _m = drop
let _t = sc

let w = (drop?.size.width)! + 6 // * 1.01
let h = (drop?.size.height)! + 6 // * 1.01

let sDrop = scaledImage(image: drop!, w: w, h: h)
let bDrop = boundedImage(image: drop!, w: w, h: h)

m2 = maskImage(image: sDrop, mask: bDrop)

var iv2 = UIImageView(image: m2)
iv2.frame.origin.x = 20
iv2.frame.origin.y = 140

//iv2.backgroundColor = UIColor.yellow

cView.addSubview(iv2)



//UIImage *scaledImage =
//	[UIImage imageWithCGImage:[imageToScale CGImage]
//		scale:(imageToScale.scale * 3.0)
//		orientation:(imageToScale.imageOrientation)];


//
//
//
//if 0 == 1 {
//if let maskImage = tmpMaskImage {
//
//	var r = CGRect(origin: CGPoint.zero, size: maskImage.size)
//
//	UIGraphicsBeginImageContextWithOptions(maskImage.size, false, maskImage.scale)
//	var context = UIGraphicsGetCurrentContext()
//
//	context?.setFillColor(UIColor.white.cgColor)
//
//	context?.fill(r)
//
//	var tmpWhiteImage = UIGraphicsGetImageFromCurrentImageContext()
//
//	UIGraphicsEndImageContext()
//	
//	var ciContext = CIContext(options: nil)
//	var filter = CIFilter(name: "CIBlendWithAlphaMask")
//	
//	var ciInput = CIImage(image: tmpWhiteImage!)
//	var ciMask = CIImage(image: maskImage)
//
//	filter?.setDefaults()
//	filter?.setValue(ciInput, forKey: kCIInputImageKey)
//	filter?.setValue(ciMask, forKey: kCIInputMaskImageKey)
//	
//	var whiteBackground = filter?.outputImage
//
//	var scImage = scaledImage(image: targImage!, w: maskImage.size.width, h: maskImage.size.height)
//
////	scImage = scaledImage(image: maskImage, w: maskImage.size.width, h: maskImage.size.height - 20)
//
//
//	filter = CIFilter(name: "CIBlendWithMask")
//	
//	ciInput = CIImage(image: scImage)
//	ciMask = CIImage(image: maskImage)
//
//	var ciBKG = whiteBackground
//
//	filter?.setDefaults()
//	filter?.setValue(ciInput, forKey: kCIInputImageKey)
//	filter?.setValue(ciMask, forKey: kCIInputMaskImageKey)
//	
//	filter?.setValue(ciBKG, forKey: kCIInputBackgroundImageKey)
//	
//	let image = UIImage(cgImage: ciContext.createCGImage((filter?.outputImage)!, from: (filter?.outputImage?.extent)!)!)
//
////	image = [UIImage imageWithCGImage: [ciContext createCGImage: filter.outputImage
//		//fromRect: [filter.outputImage extent]]];
//
//	let imgV = UIImageView(image: image)
//
////	cView.addSubview(imgV)
//}
//
//}

//// The two-tone mask image
//UIImage *maskImage = [UIImage imageNamed: @"Mask"];
//
//// Create a filler image of whatever color we want the border to be (in my case white)
//UIGraphicsBeginImageContextWithOptions(maskImage.size, NO, maskImage.scale);
//CGContextRef context = UIGraphicsGetCurrentContext();
//CGContextSetFillColorWithColor(context, UIColor.whiteColor.CGColor);
//CGContextFillRect(context, CGRectMake(0.f, 0.f, maskImage.size.width, maskImage.size.height));
//UIImage *whiteImage = UIGraphicsGetImageFromCurrentImageContext();
//UIGraphicsEndImageContext();
//
//// Use CoreImage to mask the colored background to the mask (the entire opaque region of the mask)
//CIContext *ciContext = [CIContext contextWithOptions: nil];
//CIFilter *filter = [CIFilter filterWithName: @"CIBlendWithAlphaMask"];
//[filter setValue: [CIImage imageWithCGImage: whiteImage.CGImage]
//forKey: kCIInputImageKey];
//[filter setValue: [CIImage imageWithCGImage: maskImage.CGImage]
//forKey: kCIInputMaskImageKey];
//
//CIImage *whiteBackground = filter.outputImage;
//
//// scale the target image to the size of the mask (accounting for image scale)
//// ** Uses NYXImageKit
//image = [image scaleToSize: CGSizeMake(maskImage.size.width * maskImage.scale, maskImage.size.height * maskImage.scale)
//usingMode: NYXResizeModeAspectFill];
//
//// finally use Core Image to create our image using the masked white from above for our border and the inner (white) area of our mask image to mask the target image before compositing
//filter = [CIFilter filterWithName: @"CIBlendWithMask"];
//[filter setValue: [CIImage imageWithCGImage: image.CGImage]
//forKey: kCIInputImageKey];
//[filter setValue: whiteBackground
//forKey: kCIInputBackgroundImageKey];
//[filter setValue: [CIImage imageWithCGImage: maskImage.CGImage]
//forKey: kCIInputMaskImageKey];
//
//image = [UIImage imageWithCGImage: [ciContext createCGImage: filter.outputImage
//fromRect: [filter.outputImage extent]]];
