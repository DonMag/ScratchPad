
//import Foundation
import UIKit
import PlaygroundSupport

extension Int {
	var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
	var degreesToRadians: Self { return self * .pi / 180 }
	var radiansToDegrees: Self { return self * 180 / .pi }
}

class VariableCornerRadiusView: UIView  {
	
	var upperLeftCornerRadius:CGFloat = 0 {
		didSet {
			self.setNeedsLayout()
		}
	}

	var upperRightCornerRadius:CGFloat = 0 {
		didSet {
			self.setNeedsLayout()
		}
	}

	var lowerLeftCornerRadius:CGFloat = 0 {
		didSet {
			self.setNeedsLayout()
		}
	}

	var lowerRightCornerRadius:CGFloat = 0 {
		didSet {
			self.setNeedsLayout()
		}
	}


	func layoutMask() -> Void {
		
		var pt = CGPoint.zero
		
		let myBezier = UIBezierPath()
		
		pt.x = upperLeftCornerRadius
		pt.y = 0

		myBezier.move(to: pt)
		
		pt.x = bounds.width - upperRightCornerRadius
		pt.y = 0
		
		myBezier.addLine(to: pt)

		pt.x = bounds.width - upperRightCornerRadius
		pt.y = upperRightCornerRadius
		
		myBezier.addArc(withCenter: pt, radius: upperRightCornerRadius, startAngle: CGFloat(270.degreesToRadians), endAngle: CGFloat(0.degreesToRadians), clockwise: true)

		pt.x = bounds.width
		pt.y = bounds.height - lowerRightCornerRadius
		
		myBezier.addLine(to: pt)
		
		pt.x = bounds.width - lowerRightCornerRadius
		pt.y = bounds.height - lowerRightCornerRadius

		myBezier.addArc(withCenter: pt, radius: lowerRightCornerRadius, startAngle: CGFloat(0.degreesToRadians), endAngle: CGFloat(90.degreesToRadians), clockwise: true)
		
		pt.x = lowerLeftCornerRadius
		pt.y = bounds.height
		
		myBezier.addLine(to: pt)
		
		pt.x = lowerLeftCornerRadius
		pt.y = bounds.height - lowerLeftCornerRadius
		
		myBezier.addArc(withCenter: pt, radius: lowerLeftCornerRadius, startAngle: CGFloat(90.degreesToRadians), endAngle: CGFloat(180.degreesToRadians), clockwise: true)
		
		pt.x = 0
		pt.y = upperLeftCornerRadius
		
		myBezier.addLine(to: pt)
		
		pt.x = upperLeftCornerRadius
		pt.y = upperLeftCornerRadius
		
		myBezier.addArc(withCenter: pt, radius: upperLeftCornerRadius, startAngle: CGFloat(180.degreesToRadians), endAngle: CGFloat(270.degreesToRadians), clockwise: true)
		
		myBezier.close()
		
		let maskForPath = CAShapeLayer()
		maskForPath.path = myBezier.cgPath
		layer.mask = maskForPath
		
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		self.layoutMask()
	}
	
}

var testSize = CGSize(width: 200, height: 200)

// set up an orange view to hold it...
let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 260))

containerView.backgroundColor = UIColor.orange

// create a VariableCornerRadiusView, just a little smaller than the container view
let TestView = VariableCornerRadiusView(frame: containerView.bounds.insetBy(dx: 20, dy: 20))

// set different radius for each corner
TestView.upperLeftCornerRadius = 20.0
TestView.upperRightCornerRadius = 40.0
TestView.lowerRightCornerRadius = 60.0
TestView.lowerLeftCornerRadius = 80.0

// give it a blue background
TestView.backgroundColor = UIColor.blue

// add it to the container
containerView.addSubview(TestView)

// show it
PlaygroundPage.current.liveView = containerView






class curvedBottomView: UIView  {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.doInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.doInit()
	}
	
	func doInit() -> Void {
		
		let rect = self.bounds
		let y:CGFloat = rect.size.height - 20
		let curveTo:CGFloat = rect.size.height
		
		let myBezier = UIBezierPath()
		myBezier.move(to: CGPoint(x: 0, y: y))
		myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: y), controlPoint: CGPoint(x: rect.width / 2, y: curveTo))
		myBezier.addLine(to: CGPoint(x: rect.width, y: 0))
		myBezier.addLine(to: CGPoint(x: 0, y: 0))
		myBezier.close()
		
		let maskForPath = CAShapeLayer()
		maskForPath.path = myBezier.cgPath
		layer.mask = maskForPath
		
	}
	
	
}


/*
var targetFrame = CGRect(x: 40, y: 40, width: 300, height: 300)


let sampleImage = UIImage(named: "swiftBlue.png")
let imgView = UIImageView(image: sampleImage)
let imgView2 = UIImageView(image: sampleImage)

let cbView = curvedBottomView(frame: targetFrame)
cbView.clipsToBounds = true

imgView.frame = CGRect(x: 0, y: 0, width: targetFrame.width, height: targetFrame.height)
cbView.addSubview(imgView)

containerView.addSubview(cbView)


let imgG = UIImage(named: "swiftGreen.png")
targetFrame.origin.x = 200
targetFrame.origin.y = 200

	let vcrView = VariableCornerRadiusView(frame: targetFrame)
	vcrView.backgroundColor = UIColor.red
	
	vcrView.upperLeftCornerRadius = 64.0
	vcrView.upperRightCornerRadius = 40.0
	vcrView.lowerLeftCornerRadius = 32.0
	vcrView.lowerRightCornerRadius = 80.0

//vcrView.setNeedsLayout()

//	containerView.addSubview(vcrView)
	

let imgViewG = UIImageView(image: imgG)
imgViewG.frame = vcrView.bounds
//vcrView.addSubview(imgViewG)


let v = UIView(frame: targetFrame)
v.backgroundColor = UIColor.white
v.layer.cornerRadius = 40.0

v.alpha = 0.95

if 1 == 2 {
	containerView.addSubview(vcrView)

	containerView.addSubview(v)
} else {
//	containerView.addSubview(v)
	
	containerView.addSubview(vcrView)
}



PlaygroundPage.current.liveView = containerView
//PlaygroundPage.current.needsIndefiniteExecution = true

*/














