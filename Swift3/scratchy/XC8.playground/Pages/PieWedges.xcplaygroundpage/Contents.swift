//: [Previous](@previous)

import Foundation

import UIKit
import PlaygroundSupport

var screenSize = CGSize(width: 600, height: 600)

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
containerView.backgroundColor = UIColor.lightGray

let bkgv = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 200))
bkgv.backgroundColor = UIColor.white
containerView.addSubview(bkgv)

extension CGFloat {
	static func random() -> CGFloat {
		return CGFloat(arc4random()) / CGFloat(UInt32.max)
	}
}

extension UIColor {
	static func randomColorARC4() -> UIColor {
		return UIColor(red:   .random(),
		               green: .random(),
		               blue:  .random(),
		               alpha: 1.0)
	}
}

extension UIColor {
	static func randomColor48() -> UIColor {
		return UIColor(red:   CGFloat(drand48()),
		               green: CGFloat(drand48()),
		               blue:  CGFloat(drand48()),
		               alpha: 1.0)
	}
}

extension CGFloat {
	func radians() -> CGFloat {
		let b = CGFloat(M_PI) * (self/180)
		return b
	}
}

extension UIBezierPath {
	convenience init(circleSegmentCenter center:CGPoint, radius:CGFloat, startAngle:CGFloat, endAngle:CGFloat)
	{
		self.init()
		self.move(to: CGPoint(x: center.x, y: center.y))

		self.addArc(withCenter: center,
		            radius: radius,
		            startAngle: startAngle.radians(),
		            endAngle: endAngle.radians(),
		            clockwise: true)
		self.close()
	}
}

class RadialGradientLayer: CALayer {
	
	required override init() {
		super.init()
		needsDisplayOnBoundsChange = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	required override init(layer: Any) {
		super.init(layer: layer)
	}
	
	public var colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
	
	override func draw(in ctx: CGContext) {
		ctx.saveGState()
		
		let colorSpace = CGColorSpaceCreateDeviceRGB()
		var locations = [CGFloat]()
		for i in 0...colors.count-1 {
			locations.append(CGFloat(i) / CGFloat(colors.count))
		}
		let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
		let center = CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
		let radius = min(bounds.width / 2.0, bounds.height / 2.0)
		ctx.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: radius, options: CGGradientDrawingOptions(rawValue: 0))
	}
}

func pieChartA(pieces:[(UIBezierPath, UIColor)], viewRect:CGRect) -> UIView {
	
	var layers = [CAShapeLayer]()
//	var grads = [CAGradientLayer]()
	var grads = [RadialGradientLayer]()
	
	for p in pieces {
		
		let layer = CAShapeLayer()
		layer.path = p.0.cgPath
		layer.fillColor = p.1.cgColor
		layer.strokeColor = UIColor.white.cgColor
		
		layers.append(layer)
		
//		let grad = CAGradientLayer()
//		grad.frame = layer.frame
//		grad.colors = [p.1.cgColor, UIColor.white.cgColor]
//		grad.colors = [p.1.cgColor, UIColor.black.cgColor]
//		grad.startPoint = CGPoint(x: 0, y: 0)
//		grad.endPoint = CGPoint(x: 1.0, y: 1.0)
//		grad.locations = [0.250, 1.0]

		let grad = RadialGradientLayer()
		grad.colors = [p.1.cgColor, UIColor.cyan.cgColor]
//		grad.frame = viewRect
		
		let mask = CAShapeLayer()
//		mask.frame = grad.frame
		mask.path = layer.path
		mask.fillColor = UIColor.black.cgColor

		grad.mask = mask
		
		grads.append(grad)
		
	}
	
	let view = UIView(frame: viewRect)
	
	zip(layers, grads).forEach {
		
//		$0.fillColor = UIColor.white.cgColor
//		view.layer.addSublayer($0)

		$1.frame = view.bounds
		view.layer.addSublayer($1)

		$0.fillColor = nil
		$0.frame = view.bounds
//		view.layer.addSublayer($0)
	}
	
	return view
}

let rectSize = CGRect(x: 0, y: 0, width: 400, height: 400)

let centrePointOfChart = CGPoint(x: rectSize.midX, y: rectSize.midY)

let radius:CGFloat = 200

var aStart: CGFloat = 0

let pcts: [CGFloat] = [25, 50, 25]
let agls = pcts.map { 360 * $0 / 100 }
let clrs: [UIColor] = [.blue, .red, .green]

var piePieces = [(UIBezierPath, UIColor)]()

let b = false

for (idx, val) in agls.enumerated() {
	
	if b {
		
		piePieces.append((UIBezierPath(circleSegmentCenter: centrePointOfChart, radius: radius, startAngle: aStart, endAngle: aStart + val), UIColor.randomColorARC4()))

	} else {
		
		piePieces.append((UIBezierPath(circleSegmentCenter: centrePointOfChart, radius: radius, startAngle: aStart, endAngle: aStart + val), clrs[idx]))
		
	}
	
	aStart += val
}


let pcA = pieChartA(pieces: piePieces, viewRect: rectSize)

containerView.addSubview(pcA)


PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true
