
import Foundation
import UIKit
import SceneKit
import PlaygroundSupport

public class AnalogGauge: UIView {
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.cyan
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func draw(_ rect: CGRect) {
		
		let center = CGPoint(x:bounds.width/2, y: bounds.height)
		
		var radius: CGFloat = max(bounds.width, bounds.height+50)
		
		// Define the thickness of the arc.
		let arcWidth: CGFloat = 1
		
		let startAngle: CGFloat = CGFloat(M_PI) // π
		let endAngle: CGFloat = CGFloat(2 * M_PI) // π
		
		let counterColor = UIColor.red
		
		var path = UIBezierPath(arcCenter: center,
		                        radius: radius/2 - arcWidth/2,
		                        startAngle: startAngle,
		                        endAngle: endAngle,
		                        clockwise: true)
		
		path.lineWidth = arcWidth
		counterColor.setStroke()
		path.stroke()
		

		// init vars for later use
		var nTicks = 0
		var tickWidth = 0.0
		var gapWidth = 0.0
		
		
		radius += 20
		
		path = UIBezierPath(arcCenter: center,
		                    radius: radius/2 - arcWidth/2,
		                    startAngle: startAngle,
		                    endAngle: endAngle,
		                    clockwise: true)
		
		let strokeColor            = UIColor.black.cgColor
		
		let roundThinLayer = CAShapeLayer()
		
		// number of short ticks to draw
		nTicks = 151

		// thickness of short ticks
		tickWidth = 0.5
		
		// calculate the gap between ticks
		gapWidth = ((M_PI * Double(radius) / 2) - (tickWidth * Double(nTicks))) / Double(nTicks - 1)
		
		roundThinLayer.path             = path.cgPath
		roundThinLayer.strokeColor      = strokeColor
		roundThinLayer.lineWidth        = 20.0
		roundThinLayer.fillColor        = UIColor.clear.cgColor
		roundThinLayer.lineDashPattern  = [ tickWidth as NSNumber, gapWidth as NSNumber ]
		roundThinLayer.lineDashPhase    = CGFloat(tickWidth / Double(2))
		
		
		self.layer.addSublayer(roundThinLayer)
		
		
		radius += 20
		
		path = UIBezierPath(arcCenter: center,
		                    radius: radius/2 - arcWidth/2,
		                    startAngle: startAngle,
		                    endAngle: endAngle,
		                    clockwise: true)

		let roundThickLayer = CAShapeLayer()
		

		// number of tall ticks to draw
		nTicks = 7
		
		// thickness of tall ticks
		tickWidth = 1.5
		
		// calculate the gap between ticks
		gapWidth = ((M_PI * Double(radius) / 2) - (tickWidth * Double(nTicks))) / Double(nTicks - 1)
		
		roundThickLayer.path            = path.cgPath
		roundThickLayer.strokeColor     = strokeColor
		roundThickLayer.lineWidth       = 40
		roundThickLayer.fillColor       = UIColor.clear.cgColor
		roundThickLayer.lineDashPattern = [ tickWidth as NSNumber, gapWidth as NSNumber ]
		roundThickLayer.lineDashPhase   = CGFloat(tickWidth / Double(2))
		self.layer.addSublayer(roundThickLayer)
		
		self.clipsToBounds = true
		
		
	}
}

public class SimpleLine: UIView  {
	
	public init() {
		super.init(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
		backgroundColor = UIColor.white
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	public override func draw(_ rect: CGRect) {
		let x0 = 0.0
		let x1 = 400.0
		let y0 = 0.0
		let y1 = 300.0
		
		let desiredDistance = 100.0
		
		let context = UIGraphicsGetCurrentContext()
		context?.setLineWidth(4.0)
		context?.setStrokeColor(UIColor.darkGray.cgColor)
		context?.move(to: CGPoint(x: x0, y: y0))
		context?.addLine(to: CGPoint(x: x1, y: y1))
		context?.strokePath()
		
		let baseLen = x1 - x0
		let legLen  = y1 - y0
		
		let hypLen = sqrt(baseLen * baseLen + legLen * legLen)
		
		let dRatio = desiredDistance / hypLen
		
		let x2 = ((1 - desiredDistance) * x0) + (dRatio * x1)
		let y2 = ((1 - desiredDistance) * y0) + (dRatio * y1)
		
		context?.setFillColor(UIColor.red.cgColor)
		context?.setLineWidth(1.0)
		context?.fillEllipse(in: CGRect(x: x2 - 4, y: y2 - 4, width: 8.0, height: 8.0))
		context?.strokeEllipse(in: CGRect(x: x2 - 12, y: y2 - 12, width: 24.0, height: 24.0))
		context?.stroke(CGRect(x: x2 - 12, y: y2 - 12, width: 24.0, height: 24.0))
		
		// hmmm???
		let shp = CAShapeLayer()
		shp.bounds = bounds
		let pth = UIBezierPath()
		pth.move(to: CGPoint(x: 20, y: 20))
		pth.addLine(to: CGPoint(x: 20, y: 40))
		pth.addLine(to: CGPoint(x: 40, y: 80))
		pth.addLine(to: CGPoint(x: 120, y: 140))
		pth.addLine(to: CGPoint(x: 140, y: 40))
		pth.close()
		shp.strokeColor = UIColor.orange.cgColor
		shp.fillColor = UIColor.cyan.cgColor
		shp.lineWidth = 3.0
		
		shp.path = pth.cgPath
		self.layer.addSublayer(shp)

	}
	
}

let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 700))
//
container.backgroundColor = UIColor.green

let firstLine = SimpleLine()

container.addSubview(firstLine)


let w = 300
let h = Int(Double(w) * 1.0)
let aView = AnalogGauge(frame: CGRect(x: 20, y: 320, width: w, height: h))

container.addSubview(aView)


let v = UIView(frame: CGRect(x: 100, y: 100, width: 300, height: 300))
v.backgroundColor = UIColor.yellow

let shp = CAShapeLayer()
shp.bounds = v.bounds
let pth = UIBezierPath()
pth.move(to: CGPoint(x: 20, y: 220))
pth.addLine(to: CGPoint(x: 20, y: 40))
pth.addLine(to: CGPoint(x: 40, y: 80))
pth.addLine(to: CGPoint(x: 120, y: 40))
pth.addLine(to: CGPoint(x: 140, y: 40))
pth.close()
shp.strokeColor = UIColor.orange.cgColor
shp.fillColor = UIColor.cyan.cgColor
shp.lineWidth = 3.0

shp.lineDashPattern = [5, 5]

shp.path = pth.cgPath
shp.position = CGPoint(x: 150, y: 150)
v.layer.addSublayer(shp)

container.addSubview(v)

let dashAnim = CABasicAnimation(keyPath: "lineDashPhase")
dashAnim.fromValue = 0
dashAnim.toValue = 15
dashAnim.duration = 0.75
dashAnim.repeatCount = 10000

shp.add(dashAnim, forKey: "lineDashPhase")

PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true


