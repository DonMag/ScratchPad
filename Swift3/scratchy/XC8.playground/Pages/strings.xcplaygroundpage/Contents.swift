//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

extension String {
	var drop0xPrefix:          String { return hasPrefix("0x") ? String(characters.dropFirst(2)) : self }
	var drop0bPrefix:          String { return hasPrefix("0b") ? String(characters.dropFirst(2)) : self }
	var hexaToDecimal:            Int { return Int(drop0xPrefix, radix: 16) ?? 0 }
	var hexaToBinaryString:    String { return String(hexaToDecimal, radix: 2) }
	var decimalToHexaString:   String { return String(Int(self) ?? 0, radix: 16) }
	var decimalToBinaryString: String { return String(Int(self) ?? 0, radix: 2) }
	var binaryToDecimal:          Int { return Int(drop0bPrefix, radix: 2) ?? 0 }
	var binaryToHexaString:    String { return String(binaryToDecimal, radix: 16) }
}

extension Int {
	var toBinaryString: String { return String(self, radix: 2) }
	var toHexaString:   String { return String(self, radix: 16) }
}


extension String {

	func splitByCount(n: Int, includeRemainder: Bool = false, useRegex: Bool = false) -> [String] {
		
		var rtn = [String]()

		if useRegex {

			var pattern = ""
			for _ in 0..<n {
				pattern += "."
			}
			var regex: NSRegularExpression
			do {
				let rgx = try NSRegularExpression(pattern: pattern, options: [])
				regex = rgx
			} catch {
				// error creating regex
				return rtn
			}
			let NSCopy = self as NSString
			let matches = regex.matchesInString(self, options: [], range: NSMakeRange(0, NSCopy.length))
			
			rtn = matches.map{NSCopy.substringWithRange($0.range)}
			
			if includeRemainder && self.characters.count % n != 0 {
				rtn.append(self.substringFromIndex(self.endIndex.advancedBy(-(self.characters.count % n))))
			}

		} else {
			
			var j = self.startIndex
			
			while (j.distanceTo(self.endIndex) >= n) {

				let i = j

				j = j.advancedBy(n)

				rtn.append(self.substringWithRange(i..<j))
				
			}
			
			if includeRemainder && j < self.endIndex {
				rtn.append(self.substringFromIndex(j))
			}
			
		}
		
		return rtn
		
	}
	
}

func ssplit(aString: String) -> [String]{
	var i = aString.startIndex
	var j = aString.startIndex.advancedBy(2)
	var rtn = [String]()
	
	while (j <= aString.endIndex) {
		rtn.append(aString.substringWithRange(i..<j))
		i = j
		
		if j.distanceTo(aString.endIndex) >= 2 {
			j = j.advancedBy(2)
		} else if j.distanceTo(aString.endIndex) == 1 {
			j = j.advancedBy(1)
		} else {
			break
		}
	}
	
	return rtn
}

var nstr = "0x2020"

nstr = "FredHead2"
nstr = "12345"
nstr = "This is the story of a man named Jed"
nstr = "AABBCCDDEEFFGGHHII"
nstr = "AAABBBCCCDDDEEEFFF"

var nLen = 5
var ssp = nstr.splitByCount(nLen, includeRemainder: true, useRegex: true)
var sso = nstr.splitByCount(nLen, includeRemainder: true, useRegex: false)
var sse = nstr.splitByCount(nLen, useRegex: true)

nstr = "0x2020"
var bstr = nstr.hexaToBinaryString
var nfull = nstr.hexaToDecimal
var b16 = nfull & 0xff
var t16 = nfull >> 8

var a = []

nstr = "0x20304A3A"
bstr = nstr.hexaToBinaryString
nfull = nstr.hexaToDecimal

//for i in

var c1 = nfull >> 24
var c2 = (nfull >> 16) & 0xff
var c3 = (nfull >> 8) & 0xff
var c4 = nfull & 0xff

print("\(UnicodeScalar(c1)) - \(UnicodeScalar(c2)) - \(UnicodeScalar(c3)) - \(UnicodeScalar(c4))")

nstr = "87ea81e096e18af2"
//nstr = "12"

nstr = "FredHead2"

var thisA = Array(nstr.characters)
var thisB = thisA.prefix(2)

var thisC = thisA.removeFirst()

print(thisA)

thisA.removeFirst(3)

print(thisA)

//var tt = nstr.splitEvery(2)

var aa1: [String] = []

for cUnit in nstr.utf8 {
	aa1.append("\(cUnit)")
}
var cc1 = aa1

