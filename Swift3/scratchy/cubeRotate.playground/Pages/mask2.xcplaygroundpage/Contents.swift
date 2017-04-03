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

extension UIImage {
	func invertedImage() -> UIImage? {
		guard let cgImage = self.cgImage else { return nil }
		let ciImage = CoreImage.CIImage(cgImage: cgImage)
		guard let filter = CIFilter(name: "CIColorInvert") else { return nil }
		filter.setDefaults()
		filter.setValue(ciImage, forKey: kCIInputImageKey)
		let context = CIContext(options: nil)
		guard let outputImage = filter.outputImage else { return nil }
		guard let outputImageCopy = context.createCGImage(outputImage, from: outputImage.extent) else { return nil }
		return UIImage(cgImage: outputImageCopy)
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

func invertedImage(image: UIImage, w: CGFloat, h: CGFloat) -> UIImage {
	
	var imgsz = image.size
	var sz = CGSize(width: w, height: h)
	
	let xoff = (w - imgsz.width) / 2
	let yoff = (h - imgsz.height) / 2
	
	let p = CGPoint(x: xoff, y: yoff)
	
	let hasAlpha = true
	let scale: CGFloat = image.scale
	
	UIGraphicsBeginImageContextWithOptions(sz, !hasAlpha, scale)
//	image.draw(in: CGRect(origin: p, size: imgsz))

	image.draw(in: CGRect(origin: p, size: imgsz),
	           blendMode: CGBlendMode.color,
	           alpha: 1.0)

	let newImage = UIGraphicsGetImageFromCurrentImageContext()
	UIGraphicsEndImageContext()
	
	return newImage!
	
}

func mask2(image: UIImage, maskImage: UIImage) -> UIImage? {
	
	 let colorSpace = CGColorSpaceCreateDeviceRGB()
		
		if let maskImageRef = maskImage.cgImage {
			
			if let mainViewContentContext = CGContext(
				data: nil,
				width: Int(maskImage.size.width),
				height: Int(maskImage.size.height),
				bitsPerComponent: 8,
				bytesPerRow: 0,
				space: colorSpace,
				bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) {
				
				var ratio: CGFloat = 0
				
				ratio = maskImage.size.width / image.size.width
				
				if ratio * image.size.height < maskImage.size.height {
					ratio = maskImage.size.width / image.size.width
				}

				var rect1  =  CGRect(x: 0, y: 0, width: maskImage.size.width, height: maskImage.size.height)
				
				var rect2  = CGRect(x: -((image.size.width * ratio) - maskImage.size.width) / 2,
				                    y: -((image.size.height * ratio) - maskImage.size.height) / 2,
				                    width: image.size.width * ratio,
				                    height: image.size.width * ratio
				)

				mainViewContentContext.clip(to: rect1, mask: maskImageRef)
				mainViewContentContext.draw(image.cgImage!, in: rect2)
				
				let newImage = mainViewContentContext.makeImage()
				
				let theImage = UIImage(cgImage: newImage!)
				
				return theImage
				
			}
		}
	
	
	return nil
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


func createInvertMask(mask:UIImage, image:UIImage) -> UIImage? {
	
	if let imageReference = image.cgImage {
		if let maskReference = mask.cgImage {
			
			let msk = CGImage(
				width: maskReference.width,
				height: maskReference.height,
				bitsPerComponent: maskReference.bitsPerComponent,
				bitsPerPixel: maskReference.bitsPerPixel,
				bytesPerRow: maskReference.bytesPerRow,
				space: CGColorSpaceCreateDeviceGray(),
				bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue),
				provider: maskReference.dataProvider!,
				decode: nil,
				shouldInterpolate: false,
				intent: CGColorRenderingIntent.defaultIntent)
			
			let maskedReference = imageReference.masking(msk!)
			
			let maskedImage = UIImage(cgImage:maskedReference!)
			
			return maskedImage
			
		}
	}
	
	return nil
}

func maskWithImage(maskImage: UIImage, targetView: UIView) {
	
	let maskingLayer = CALayer()
	maskingLayer.frame = targetView.bounds
	maskingLayer.contents = maskImage.cgImage
	targetView.layer.mask = maskingLayer
	
}

//-(void) maskWithImage:(UIImage*) maskImage TargetView:(UIView*) targetView{
//	CALayer *_maskingLayer = [CALayer layer];
//	_maskingLayer.frame = targetView.bounds;
//	[_maskingLayer setContents:(id)[maskImage CGImage]];
//	[targetView.layer setMask:_maskingLayer];
//}
//	- (UIImage*) createInvertMask:(UIImage *)maskImage withTargetImage:(UIImage *) image {
//
//		CGImageRef maskRef = maskImage.CGImage;
//
//		CGBitmapInfo bitmapInfo = kCGImageAlphaNone;
//		CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
//
//		CGImageRef mask = CGImageCreate(CGImageGetWidth(maskRef),
//		                                CGImageGetHeight(maskRef),
//		                                CGImageGetBitsPerComponent(maskRef),
//		                                CGImageGetBitsPerPixel(maskRef),
//		                                CGImageGetBytesPerRow(maskRef),
//		                                CGColorSpaceCreateDeviceGray(),
//		                                bitmapInfo,
//		                                CGImageGetDataProvider(maskRef),
//		                                nil, NO,
//		                                renderingIntent);
//
//
//		CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
//
//		CGImageRelease(mask);
//		CGImageRelease(maskRef);
//
//		return [UIImage imageWithCGImage:masked];
//}
//
//

let cView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 800))
cView.backgroundColor = UIColor.blue
PlaygroundPage.current.liveView = cView

var targImage = UIImage(named: "car")
var drop = UIImage(named: "iconOutline")

drop = UIImage(named: "bwDrop")
drop = UIImage(named: "whiteTranDrop")

var m = maskImage(image: targImage!, mask: drop!)
m = mask2(image: targImage!, maskImage: drop!)

//targImage = UIImage(color: UIColor.clear, size: CGSize(width: 200, height: 200))

var iv = UIImageView(image: m)
iv.frame = CGRect(x: 10, y: 10, width: (750 / 4), height: 100)
cView.addSubview(iv)

var rd = UIImage(color: .red, size: (drop?.size)!)

let sc = UIImage(cgImage: (drop?.cgImage)!, scale: 0.75, orientation: (drop?.imageOrientation)!)

var m2 = maskImage(image: sc, mask: drop!)

let _m = drop
let _t = sc

var w = (drop?.size.width)! + 6 // * 1.01
var h = (drop?.size.height)! + 6 // * 1.01

let sDrop = scaledImage(image: drop!, w: w, h: h)
let bDrop = boundedImage(image: drop!, w: w, h: h)

m2 = maskImage(image: sDrop, mask: bDrop)

var iv2 = UIImageView(image: m2)
iv2.frame.origin.x = 20
iv2.frame.origin.y = 140

cView.addSubview(iv2)

targImage = UIImage(named: "car")
drop = UIImage(named: "bwDrop")

var whiteRect = UIImage(color: .black, size: (drop?.size)!)
var invertMask = createInvertMask(mask: drop!, image: whiteRect!)

w = (drop?.size.width)! + 0 // * 1.01
h = (drop?.size.height)! + 0 // * 1.01


var iDrop = invertedImage(image: drop!, w: w, h: h)

iDrop = drop!.invertedImage()!

//targImage?.draw(in: r, blendMode: <#T##CGBlendMode#>, alpha: <#T##CGFloat#>)

var iv3 = UIImageView(image: iDrop)
iv3.frame.origin.x = 20
iv3.frame.origin.y = 380

//iv3.image = invertMask

//maskWithImage(maskImage: invertMask!, targetView: iv3)

//iv3.layer.mask = maskLayer

cView.addSubview(iv3)


//	- (UIImage*) createInvertMask:(UIImage *)maskImage withTargetImage:(UIImage *) image {
//		
//		CGImageRef maskRef = maskImage.CGImage;
//		
//		CGBitmapInfo bitmapInfo = kCGImageAlphaNone;
//		CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
//		
//		CGImageRef mask = CGImageCreate(CGImageGetWidth(maskRef),
//		                                CGImageGetHeight(maskRef),
//		                                CGImageGetBitsPerComponent(maskRef),
//		                                CGImageGetBitsPerPixel(maskRef),
//		                                CGImageGetBytesPerRow(maskRef),
//		                                CGColorSpaceCreateDeviceGray(),
//		                                bitmapInfo,
//		                                CGImageGetDataProvider(maskRef),
//		                                nil, NO,
//		                                renderingIntent);
//		
//		
//		CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
//		
//		CGImageRelease(mask);
//		CGImageRelease(maskRef);
//		
//		return [UIImage imageWithCGImage:masked];
//}
//
//

