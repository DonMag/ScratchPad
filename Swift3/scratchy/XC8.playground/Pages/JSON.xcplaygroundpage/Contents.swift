//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

import UIKit

let url = NSBundle.mainBundle().URLForResource("gistfile1", withExtension: "txt")
let fileContents = NSData(contentsOfURL: url!)

var gVal = ""

func test() {
	
	do {
		guard let fileContents = fileContents else { return }
		guard let jsonDict = try NSJSONSerialization.JSONObjectWithData(fileContents, options: []) as? NSDictionary else { return }
		guard let featuresArray = jsonDict["features"] as? NSArray else { return }
		guard featuresArray.count > 0 else { return }
		guard let featuresDict = featuresArray[0] as? NSDictionary else { return }
		guard let coordinatesArray = featuresDict["geometry"] else { return }
		guard coordinatesArray.count > 0 else { return }
		guard let coordinateArray = coordinatesArray[0] as? NSArray else { return }
		guard coordinateArray.count > 3 else { return }
		var oneFeature = coordinateArray[3]
		
		gVal = "oneFeature: \(oneFeature)"
		
		//	...stuff...
	} catch let error as NSError {
		print("Failed to load: \(error.localizedDescription)")
	} catch {
		
	}
	

}

test()

print("gv \(gVal)")

do {
	let jsonDict = try NSJSONSerialization.JSONObjectWithData(fileContents!, options: []) as! NSDictionary
	if let features = jsonDict["features"] as? [Dictionary<String, AnyObject>] {
		
		
		var oneFeature = features[0]["geometry"]!["coordinates"]!![0][3]

		var aFeature = features[0]
		
//		var geom = aFeature["geometry"] as? [Dictionary<String, AnyObject>]
		
		if let dictionary = aFeature["geometry"] as? [String: AnyObject] {
			
			var t = dictionary["type"]
			
			var c = dictionary["coordinates"] as! NSArray
			
			var cpair = c[0]
			
			var cp2 = cpair[0]
			
		}

		
		
		
////		var coords = geom[0]
//		
//		
//		
//		for feature in features {
//			if let geometry = feature["geometry"] as? Dictionary<String, AnyObject> {
//				if let coordinates = geometry["coordinates"] as? Dictionary<Int, AnyObject> {
//					let coordinatesPair = coordinates[0]
//					
////					print("cp: \(coordinatesPair)")
//					
////					let path = GMSMutablePath()
//					
//					//                            for coords in coordinatesPair {
//					//                                    let longitude = coords[0].doubleValue
//					//                                    let latitude = coords[1].doubleValue
//					//    //                            print("Latitude: \(latitude), Longitude: \(longitude)")
//					//
//					//                                    path.addCoordinate(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
//					//                            }
//					//
//					//                            let polyline = GMSPolyline(path: path)
//					//                            polyline.strokeColor = UIColor.redColor()
//					//                            polyline.strokeWidth = 5
//					//                            polyline.map = mapView
//				}
//			}
//		}
	}
} catch let error as NSError {
	print("Failed to load: \(error.localizedDescription)")
} catch {
	
}
