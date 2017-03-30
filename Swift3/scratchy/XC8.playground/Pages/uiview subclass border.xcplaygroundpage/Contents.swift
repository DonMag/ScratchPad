//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport



final class BorderedView:UIView
{
	var drawTopBorder = false
	var drawBottomBorder = false
	var drawLeftBorder = false
	var drawRightBorder = false
	
	var topBorderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
	var leftBorderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
	var rightBorderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
	var bottomBorderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
	
	var upperLeftCornerRadius:CGFloat = 0
	var upperRightCornerRadius:CGFloat = 0
	var lowerLeftCornerRadius:CGFloat = 0
	var lowerRightCornerRadius:CGFloat = 0
	
	var subview:UIView?
	fileprivate var visibleView:UIView!
	fileprivate var _backgroundColor:UIColor!
	
	override init(frame: CGRect)
	{
		super.init(frame: frame)
		super.backgroundColor = UIColor.clear
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		super.backgroundColor = UIColor.clear
	}
	
	func setVisibleBackgroundColor(_ color:UIColor)
	{
		_backgroundColor = color
	}
	
	func setBackgroundGradient(_ gradient:CAGradientLayer)
	{
		gradient.frame = visibleView.bounds
		gradient.masksToBounds = true
		visibleView.layer.insertSublayer(gradient, at: 0)
	}
	
	func drawView()
	{
		visibleView = UIView(frame: self.frame)
		visibleView.backgroundColor = _backgroundColor
		visibleView.clipsToBounds = true
		if let v = subview
		{
			visibleView.addSubview(v)
		}
	}
	
	override func draw(_ rect: CGRect)
	{
		// Drawing code
		let width = rect.size.width - 0.5;
		let height = rect.size.height - 0.5;
		
		guard let context = UIGraphicsGetCurrentContext() else { return }
		let w = self.frame.size.width;
		let h = self.frame.size.height;
		
		// Create clipping area as path.
		let path = CGMutablePath();
		path.move(to: CGPoint(x: 0, y: upperLeftCornerRadius))
		path.addArc(tangent1End: CGPoint(x: 0, y: 0), tangent2End: CGPoint(x: upperLeftCornerRadius, y: 0), radius: upperLeftCornerRadius)
		path.addLine(to: CGPoint(x: w - upperRightCornerRadius, y: 0))
		path.addArc(tangent1End: CGPoint(x: w, y: 0), tangent2End: CGPoint(x: w, y: upperRightCornerRadius), radius: upperRightCornerRadius)
		path.addLine(to: CGPoint(x: w, y: h - lowerRightCornerRadius))
		path.addArc(tangent1End: CGPoint(x: w, y: h), tangent2End: CGPoint(x: w - lowerRightCornerRadius, y: h), radius: lowerRightCornerRadius)
		path.addLine(to: CGPoint(x: lowerLeftCornerRadius, y: h))
		path.addArc(tangent1End: CGPoint(x: 0, y: h), tangent2End: CGPoint(x: 0, y: h - lowerLeftCornerRadius), radius: lowerLeftCornerRadius)
		path.closeSubpath();
		// Add clipping area to path
		context.addPath(path);
		// Clip to the path and draw the image
		context.clip ();
		
		self.drawView()
		visibleView.layer.render(in: context)
		
		// ********** Your drawing code here **********
		context.setLineWidth(2.5);
		var stroke = false
		
		if (drawTopBorder)
		{
			context.setStrokeColor(topBorderColor.cgColor);
			context.move(to: CGPoint(x: 0, y: 0.5)); //start at this point
			context.addLine(to: CGPoint(x: width, y: 0.5)); //draw to this point
			stroke = true
		}
		
		if (drawLeftBorder)
		{
			context.setStrokeColor(leftBorderColor.cgColor);
			context.move(to: CGPoint(x: 0.5, y: 0.5)); //start at this point
			context.addLine(to: CGPoint(x: 0.5, y: height)); //draw to this point
			stroke = true
		}
		
		if (drawBottomBorder)
		{
			context.setStrokeColor(bottomBorderColor.cgColor);
			context.move(to: CGPoint(x: 0.5, y: height)); //start at this point
			context.addLine(to: CGPoint(x: width, y: height)); //draw to this point
			stroke = true
		}
		
		if (drawRightBorder)
		{
			context.setStrokeColor(rightBorderColor.cgColor);
			context.move(to: CGPoint(x: width, y: 0.5)); //start at this point
			context.addLine(to: CGPoint(x: width, y: height)); //draw to this point
			stroke = true
		}
		
		// and now draw the Path!
		if stroke
		{
			context.strokePath();
		}
	}
}


var screenSize = CGSize(width: 600, height: 800)

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
containerView.backgroundColor = UIColor.lightGray

let bv = BorderedView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))

bv.backgroundColor = UIColor.clear
bv.upperLeftCornerRadius = 16.0
bv.upperRightCornerRadius = 40.0
bv.drawTopBorder = true
bv.drawLeftBorder = true
bv.drawBottomBorder = true
bv.drawRightBorder = true
containerView.addSubview(bv)

PlaygroundPage.current.liveView = containerView
//PlaygroundPage.current.needsIndefiniteExecution = true


