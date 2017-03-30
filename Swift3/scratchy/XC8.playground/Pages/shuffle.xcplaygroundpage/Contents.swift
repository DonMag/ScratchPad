//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


extension MutableCollectionType where Self.Index == Int {
	func shuffle() -> Self {
		var r = self
		let c = self.count
		for i in 0..<(c - 1) {
			let j = Int(arc4random_uniform(UInt32(c - i))) + i
			if i != j {
				swap(&r[i], &r[j])
			}
		}
		return r
	}
}

//var c = 3
//var q = Int(arc4random_uniform(UInt32(c)))
//q = Int(arc4random_uniform(UInt32(c)))
//q = Int(arc4random_uniform(UInt32(c)))
//q = Int(arc4random_uniform(UInt32(c)))
//q = Int(arc4random_uniform(UInt32(c)))
//q = Int(arc4random_uniform(UInt32(c)))
//q = Int(arc4random_uniform(UInt32(c)))
//q = Int(arc4random_uniform(UInt32(c)))
//q = Int(arc4random_uniform(UInt32(c)))
//q = Int(arc4random_uniform(UInt32(c)))
//

