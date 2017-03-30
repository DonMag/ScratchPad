//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"


var count = 5
var index = 6

var r = (index % count + count) % count

let dictionaryOfPlots = NSMutableDictionary()

dictionaryOfPlots[1.2] = [1,2,3]
dictionaryOfPlots[2.5] = [4,5,6]
dictionaryOfPlots[9.9] = [7,8,9]

var s = dictionaryOfPlots[(1.0 + 1.5)]

var idx = (1.0 + 1.5)

s = dictionaryOfPlots[idx]

let t = dictionaryOfPlots.allKeys


let arraySorted = dictionaryOfPlots.allKeys.sort() { ($0 as! Double) < ($1 as! Double) }

var b = arraySorted[0]

print(arraySorted)

s = dictionaryOfPlots[((b as! Double) + 0.0)]

var aTwo = NSMutableArray()

var i = 0

for k in arraySorted {
	i = i + 3
	b = (k as! Double) + 0.0
	s = dictionaryOfPlots[(k as! Double) + 0.0]
	aTwo.addObject(s!)
//	aTwo.addObject([k : dictionaryOfPlots[(k as! Double)]])
}

print(aTwo)

//let sortedPlots = Array(dictionaryOfPlots).sort({ $0.0 < $1.0 })


//customArray.sortInPlace { (element1, element2) -> Bool in
//	return element1.someSortableField < element2.someSortableField
//}


//: [Next](@next)
