//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

var i = 0

func someLocalFunction() -> String? {
	if i > 10 {
		return nil
	}
	i = i + 1
	return "\(i)"
}

func doSomethingWithMyValue(myValue: String?) -> Void {
	print("in doSomething: \(myValue)")
}

func recursiveFunc() -> Bool {
	let myValue = someLocalFunction()
	
	guard myValue != nil else {return false}
	
	print("before async block myValue: \(myValue)")
	
	dispatch_async(dispatch_get_main_queue()) {
		
		print("in async block myValue: \(myValue)") // --> outputs sometimes something different than in output above, why?
		
		doSomethingWithMyValue(myValue)
		
		recursiveFunc()
	}
	return true
}

var b = recursiveFunc()

print("b: \(b)")
