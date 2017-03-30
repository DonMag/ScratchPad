//: [Previous](@previous)

import Foundation

//: [Next](@next)

func ssplit(aString: String, byCount: Int = 2, includeRemainder: Bool = false) -> [String] {
	
	var rtn = [String]()
	
	var j = aString.startIndex
	
	while (j.distanceTo(aString.endIndex) >= byCount) {
		
		let i = j
		
		j = j.advancedBy(byCount)
		
		rtn.append(aString.substringWithRange(i..<j))
		
	}
	
	if includeRemainder && j < aString.endIndex {
		rtn.append(aString.substringFromIndex(j))
	}
	
	return rtn
}

var str = "aabbccddeeffg"

var a1 = ssplit(str, byCount: 2, includeRemainder: false)
var a2 = ssplit(str, byCount: 2, includeRemainder: true)

