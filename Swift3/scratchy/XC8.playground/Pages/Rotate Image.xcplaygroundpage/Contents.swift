
import UIKit
import PlaygroundSupport

//func degreesToRadians(degrees: CGFloat) -> CGFloat {
//	return degrees * CGFloat(M_PI) / 180
//}

extension Int {
	var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
	var degreesToRadians: Self { return self * .pi / 180 }
	var radiansToDegrees: Self { return self * 180 / .pi }
}

class MyImgView: UIImageView {
	
	var curAngle: CGFloat = 0.0
	
	func tap(sender: UITapGestureRecognizer) {
		print("tap")
	}
 
	func pan(sender: UIPanGestureRecognizer) {
		let t = sender.translation(in: self)
		let pct = t.x / bounds.width
		let a = 180.0 * pct
		let r = a.degreesToRadians
		//let r = degreesToRadians(degrees: a)
		//curAngle += r
		print("pan t \(t)  /  a \(a)  /  r \(r)")
		self.transform = CGAffineTransform(rotationAngle: r)
	}
	
	func addGest() {

		addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(sender:))))
		
		let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(sender:)))
		addGestureRecognizer(panRecognizer)

	}
	
}

let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
//
container.backgroundColor = UIColor.green

let imgV = MyImgView(image: UIImage(named: "swiftBlue.png"))
container.addSubview(imgV)
imgV.isUserInteractionEnabled = true

let a = 30
//let r = degreesToRadians(degrees: CGFloat(a))

//imgV.transform = CGAffineTransform(rotationAngle: r)

imgV.addGest()


PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true
