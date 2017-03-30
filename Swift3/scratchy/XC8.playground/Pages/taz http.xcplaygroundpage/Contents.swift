//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let username = "test"

var urlString = "http://forzax.net63.net/ios/getinfo.php?user=\(username)"

urlString = "xhttps://api.github.com/users/donmag/repos"

let urlURL = NSURL(string: urlString)

var jGData: NSData
//var jGSON

//if let jData = NSData(contentsOfURL: urlURL!)
//{
//	jGData = jData
//	print(String(data: jGData, encoding: NSUTF8StringEncoding))
//}
//else
//{
//	jGData = NSData()
//	print("fail?")
//}
//
//
//do {
//	let json = try NSJSONSerialization.JSONObjectWithData(jGData, options: .MutableContainers) //as! [String: AnyObject]
//
//	var t0 = json[0]
//	var t1 = t0["name"]
//	
////	if let names = json["names"] as? [String] {
////		print(names)
////	}
//} catch let error as NSError {
//	print("Failed to load: \(error.localizedDescription)")
//}



//let userOtherInfo = (try NSJSONSerialization.JSONObjectWithData(NSData(contentsOfURL: NSURL(string: "http://forzax.net63.net/ios/getinfo.php?user=\(username)")!)!, options: .MutableContainers) as! [AnyObject]).first! as! [String: String]

//let doubleUser = Double(userOtherInfo["active"]!)

