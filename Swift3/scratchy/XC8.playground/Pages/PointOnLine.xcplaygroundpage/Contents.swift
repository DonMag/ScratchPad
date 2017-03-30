
import Foundation
import UIKit
import PlaygroundSupport

var arrayOfPoints: [CGPoint] = [
	CGPoint(x: 0.396464773760275, y: 0.840485369411425),
	CGPoint(x: 0.353336097245244, y: 0.446583434796544),
	CGPoint(x: 0.318692772311881, y: 0.886428433223031),
	CGPoint(x: 0.0155828494083288, y: 0.584090220317272),
	CGPoint(x: 0.0155828494083288, y: 0.384090220317272),
	CGPoint(x: 0.159368626531805, y: 0.383715874807194),
	CGPoint(x: 0.691004373382196, y: 0.1588589135927364),
	CGPoint(x: 0.691004373382196, y: 0.3588589135927364),
	CGPoint(x: 0.899854306161604, y: 0.163545950630365),
	CGPoint(x: 0.159071502581806, y: 0.533064714021855),
	CGPoint(x: 0.604144189711239, y: 0.582699021207219),
	CGPoint(x: 0.269971117907016, y: 0.390478195463409),
	CGPoint(x: 0.293400570118951, y: 0.742377406033981),
	CGPoint(x: 0.298525606318119, y: 0.0755380785377824),
	CGPoint(x: 0.404982633583334, y: 0.857377942708183),
	CGPoint(x: 0.941968323291899, y: 0.662830659789996),
	CGPoint(x: 0.846475779930007, y: 0.00275508142688352),
	CGPoint(x: 0.462379245025485, y: 0.532596024438298),
	CGPoint(x: 0.78787662089292, y: 0.265612234971371),
	CGPoint(x: 0.98275226310103, y: 0.30678513061418),
	CGPoint(x: 0.600855136489105, y: 0.608715653358658),
	CGPoint(x: 0.212438798201187, y: 0.885895130587606),
	CGPoint(x: 0.304657101745793, y: 0.15185986406857),
	CGPoint(x: 0.337661902873531, y: 0.387476950965358),
	CGPoint(x: 0.643609828900129, y: 0.753553275640016),
	CGPoint(x: 0.603616098781568, y: 0.53162825175081),
	CGPoint(x: 0.459360316334315, y: 0.652488446971034),
	CGPoint(x: 0.32718116385065, y: 0.946370485960081),
	CGPoint(x: 0.368039867432817, y: 0.943890339354468),
	CGPoint(x: 0.00742826171906685, y: 0.516599949702389),
	CGPoint(x: 0.272770952753351, y: 0.024299155634651),
	CGPoint(x: 0.591954502437812, y: 0.2049635097516)
]

func pointAboveLine(point: CGPoint, p1: CGPoint, p2: CGPoint) -> Int {
	// first, horizontally sort the points in the line
	var first: CGPoint = CGPoint.zero
	var second: CGPoint = CGPoint.zero
	
	if p1.x > p2.x {
		first = p2
		second = p1
	} else {
		first = p1
		second = p2
	}
	
	let v1 = CGPoint(x: second.x - first.x, y: second.y - first.y)
	let v2 = CGPoint(x: second.x - point.x, y: second.y - point.y)
	
	let xp = v1.x * v2.y - v1.y * v2.x
	
	// above
	if (xp > 0) {
		return 1;
	}
		// below
	else if (xp < 0) {
		return -1;
	}
		// exactly on the line
	else {
		return 0;
	}
}



public class SimpleLine: UIView  {
	
	var myArrayOfPoints = [CGPoint]()
	
	public override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.white
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	public override func draw(_ rect: CGRect) {
		let x0 = 0.0
		let x1 = Double(rect.maxX)
		let y0 = 0.0
		let y1 = Double(rect.maxY)
		
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
		
		context?.setFillColor(UIColor.blue.cgColor)
		context?.setLineWidth(1.0)
		
		for pt in myArrayOfPoints {
			context?.fillEllipse(in: CGRect(x: pt.x - 3, y: pt.y - 3, width: 6.0, height: 6.0))
		}


		if myArrayOfPoints.count > 2 {
			
			context?.setFillColor(UIColor.orange.cgColor)
			let npt = myArrayOfPoints[0] as CGPoint
			context?.fillEllipse(in: CGRect(x: npt.x - 3, y: npt.y - 3, width: 6.0, height: 6.0))

			context?.move(to: myArrayOfPoints[0])
			
			for i in 1..<myArrayOfPoints.count {
			
				context?.addLine(to: myArrayOfPoints[i])
				
			}
			
			context?.closePath()
			context?.strokePath()
		}
		
	}
	
}

func angleBetween(point1: CGPoint, point2: CGPoint) -> CGFloat {
	
	return atan2(point1.x - point2.x, point1.y - point2.y)
	
}


let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
//
container.backgroundColor = UIColor.green

let playW = 500
let playH = 400

let firstLine = SimpleLine(frame: CGRect(x: 0, y: 0, width: playW, height: playH))

container.addSubview(firstLine)

let pt1 = CGPoint(x: 0.0, y: 0.0)
let pt2 = CGPoint(x: 400.0, y: 300.0)

var pt = CGPoint(x: 10.0, y: 100.0)

var n = pointAboveLine(point: pt, p1: pt1, p2: pt2)
var a: CGFloat = 0.0

print("Above / Below? \(n)")

pt = CGPoint(x: 100.0, y: 10.0)

n = pointAboveLine(point: pt, p1: pt1, p2: pt2)

print("Above / Below? \(n)")

var points6 = arrayOfPoints[1...7]
var aPoints = points6.map { CGPoint(x: Int($0.x * CGFloat(playW)), y: Int($0.y * CGFloat(playH))) }

let t = aPoints[3]
aPoints[3] = aPoints[4]
aPoints[4] = t

for pt in aPoints {

	n = pointAboveLine(point: pt, p1: pt1, p2: pt2)
	
	print("Above / Below? \(pt.x), \(pt.y) \(n)")

}

var leftMost = aPoints.reduce(CGFloat.greatestFiniteMagnitude) { min($0, $1.x) }
print(leftMost)

var rightMost = aPoints.reduce(CGFloat.leastNormalMagnitude) { max($0, $1.x) }
print(rightMost)


//var lp = aPoints.max(by: ($0.x, $1.x))
//var lp = aPoints.max {
//	$0.0.x != $1.0.x {
//		return $0.x < $1.x
//	} else {
//		return $0.y > $1.y
//	}
//}


var lp = aPoints.max { $0.0.x != $0.1.x ? $0.0.x > $0.1.x : $0.0.y > $0.1.y }
var rp = aPoints.max { $0.0.x != $0.1.x ? $0.0.x < $0.1.x : $0.0.y < $0.1.y }

print(lp)
print(rp)

var lp2 = aPoints.min { $0.0.x != $0.1.x ? $0.0.x < $0.1.x : $0.0.y < $0.1.y }
var rp2 = aPoints.max { $0.0.x != $0.1.x ? $0.0.x < $0.1.x : $0.0.y < $0.1.y }

print(lp2)
print(rp2)

let vlp = lp! as CGPoint
let vrp = rp! as CGPoint

let cx = vlp.x + ((vrp.x - vlp.x) / 2)
let cy = vlp.y + ((vrp.y - vlp.y) / 2)
let centerPT = CGPoint(x: cx, y: cy)

for pt in aPoints {
	
	a = angleBetween(point1: centerPT, point2: pt)
	
	print("Angle?", a, pt)
	
}

firstLine.myArrayOfPoints = aPoints




//var aBelow = aPoints.filter {
////	pointAboveLine(point: $0, p1: , p2: )
//}

//print(aPoints)

PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true


//for j in 1...30 {
//	print("CGPoint(x: \(drand48()), y: \(drand48())),")
//}


//function point () {
//	if (arguments.length === 1) {
//		// either object or array
//		if (arguments[0].length !== undefined) {
//			// it's an array
//			return arguments[0];
//		}
//		return [arguments[0].x, arguments[0].y];
//	} else if (arguments.length === 2) {
//		// point(x, y)
//		return [arguments[0], arguments[1]];
//	}
//}
//
//let geometry = {
//	point: point,
//	pointAboveLine: pointAboveLine
//}
//
//function findSmallest (array, key) {
//	if (key === undefined) {
//		key = function (value) {
//			return value;
//		};
//	}
//	return array.reduce(function (a, b, i, arr) {
//		if (Math.min(key(a), key(b)) === key(a)) {
//			return a;
//		} else {
//			return b;
//		}
//	}, Infinity);
//}
//
//function findLargest (array, key) {
//	if (key === undefined) {
//		key = function (value) {
//			return value;
//		};
//	}
//	return array.reduce(function (a, b, i, arr) {
//		if (Math.max(key(a), key(b)) === key(a)) {
//			return a;
//		} else {
//			return b;
//		}
//	}, Infinity);
//}
//
//function createNonIntersectingPolygon(initialPoints, amountOfPoints, minimumArea, maximumArea) {
//	let remainingPoints = amountOfPoints - initialPoints.length;
//	
//	// algorithm to generate non intersecting polygons
//	// http://stackoverflow.com/a/20623817/2302759
//	
//	// This way of generating new points is beyond bad
//	// both the minimum and maximum area constraints are not satisfied
//	// and all polygons end up biased to the right, this is because that made sense for my application
//	// please take the time to find a better way to do this
//	let lmax = Math.sqrt(maximumArea);
//	let points = initialPoints;
//	for (var i = 0; i < remainingPoints; i++) {
//		points.push({
//			x: initialPoints[0].x + ((Math.random() - 0.5) * 2) * lmax,
//			y: initialPoints[0].y + Math.random() * lmax
//		});
//	}
//	
//	// (1) find the leftmost point p
//	let leftmost = findSmallest(points, (point) => point.x);
//	// (2) find rightmost point q
//	let rightmost = findLargest(points, (point) => point.x);
//	
//	// (3) Partition the points into A, the set of points below pq
//	//     and B, the set of points above pq
//	let A = points.filter(function (point) {
//		return geometry.pointAboveLine(geometry.point(point), geometry.point(leftmost), geometry.point(rightmost)) === -1;
//	});
//	let B = points.filter(function (point) {
//		return geometry.pointAboveLine(geometry.point(point), geometry.point(leftmost), geometry.point(rightmost)) === 1;
//	});
//	
//	// (4) sort A by increasing x-coordinates
//	A = A.sort((p1, p2) => p1.x > p2.x);
//	
//	// (5) sort B by decreasing x-coordinates
//	B = B.sort((p1, p2) => p1.x < p2.x);
//	
//	// (6) assemble a polygon in this order [p, ...A, q, ...B];
//	
//	return [leftmost, ...A, rightmost, ...B];
//}

