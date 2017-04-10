import UIKit
import CoreGraphics
import PlaygroundSupport

let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))

container.backgroundColor = UIColor.green

PlaygroundPage.current.liveView = container

class MyCustomView :UIView{
	
	//Write your code in drawRect
	override func draw(_ rect: CGRect) {
		
		//		var myBezier = UIBezierPath()
		//		myBezier.moveToPoint(CGPoint(x: 0, y: 0))
		//		myBezier.addLineToPoint(CGPoint(x: 100, y: 0))
		//		myBezier.addLineToPoint(CGPoint(x: 50, y: 100))
		//		myBezier.closePath()
		
		var pth = UIBezierPath()
		
		var pt = CGPoint(x: 40, y: 100)
		
		pth.move(to: pt)
		
		pt.x += 20
		
		pth.addLine(to: pt)
		
		pt.x += 40
		pt.y += 50
		
		pth.addLine(to: pt)
		
		pt.x -= 10
		pt.y += 40
		
		pth.addLine(to: pt)
		
		pt.x -= 50
		
		pth.addLine(to: pt)
		
		pth.close()
		
		UIColor.yellow.setFill()
		UIColor.blue.setStroke()
		
		pth.lineWidth = 12
		
		pth.stroke()
		
		
		var sp = pth.cgPath.copy(strokingWithWidth: 10, lineCap: .square, lineJoin: .miter, miterLimit: 10)
		
		
		
		var spp = UIBezierPath(cgPath: sp)
		
		spp.fill()
		
	}
	
	
}

var view = MyCustomView(frame: CGRect(x: 20, y: 20, width: 400, height: 400))

view.backgroundColor = UIColor.white

container.addSubview(view)
