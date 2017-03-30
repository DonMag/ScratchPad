
//import Foundation
import UIKit
import PlaygroundSupport

extension UIImage {
//	convenience init(view: UIView) {
//		UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
//		view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
//		let image = UIGraphicsGetImageFromCurrentImageContext()
//		UIGraphicsEndImageContext()
//		
//		self.init(cgImage: (image?.cgImage)!)
//	}

	convenience init(view: UIView) {
		let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
		let image = renderer.image { ctx in
			view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
		}
		self.init(cgImage: image.cgImage!)
	}

}

extension UIView {
	
	var snapshot: UIImage? {
		UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
		drawHierarchy(in: bounds, afterScreenUpdates: true)
		let result = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return result
	}

}

extension UIView {
	func mask(withRect rect: CGRect, inverse: Bool = false) {
		let path = UIBezierPath(rect: rect)
		let maskLayer = CAShapeLayer()
		
		if inverse {
			path.append(UIBezierPath(rect: self.bounds))
			maskLayer.fillRule = kCAFillRuleEvenOdd
		}
		
		maskLayer.path = path.cgPath
		
		self.layer.mask = maskLayer
	}
	
	func mask(withPath path: UIBezierPath, inverse: Bool = false) {
		let path = path
		let maskLayer = CAShapeLayer()
		
		if inverse {
			path.append(UIBezierPath(rect: self.bounds))
			maskLayer.fillRule = kCAFillRuleEvenOdd
		}
		
		maskLayer.path = path.cgPath
		
		self.layer.mask = maskLayer
	}
}

var screenSize = CGSize(width: 600, height: 600)

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
containerView.backgroundColor = UIColor.lightGray

let backgroundView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
backgroundView.backgroundColor = UIColor.black
backgroundView.clipsToBounds = false

//backgroundView.mask(withRect: backgroundView.bounds.insetBy(dx: 3, dy: 3), inverse: true)

let bView = UIView(frame: backgroundView.bounds.insetBy(dx: 3, dy: 3))
bView.backgroundColor = UIColor.red

let cView = UIView(frame: CGRect(x: -50, y: -50, width: 100, height: 100))
cView.backgroundColor = UIColor.yellow

bView.addSubview(cView)

backgroundView.addSubview(bView)

containerView.addSubview(backgroundView)

PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true

let nv = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
nv.backgroundColor = UIColor.cyan
let lb = UILabel(frame: nv.bounds.insetBy(dx: 12, dy: 4))
lb.text = "Hello Swift!"
let lb2 = UILabel(frame: nv.bounds.insetBy(dx: 12, dy: 4))
lb2.textAlignment = NSTextAlignment.right
lb2.text = "Goodbye"
nv.addSubview(lb)
nv.addSubview(lb2)

let i = UIImage(view: nv)

