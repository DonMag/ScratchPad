//: Playground - noun: a place where people can play
import UIKit

// peopleArray will be an Array of Dictionary objects
let thePeopleArray = [
	[   "firstName": "mom mobile", "phone": "242-1111"],
	[   "firstName": "mom", "lastName": "mobile", "phone": "242-3333"],
	[   "firstName": "mom work", "phone": "242-2222"],
	[   "firstName": "mom", "lastName": "home", "phone": "242-3333"],
	[   "firstName": "Xom", "lastName": "mobile", "phone": "242-4444"],
	[   "firstName": "Tom", "lastName": "Smith", "email": "test@mac.com"],
	[   "firstName": "John", "phone": "111-1111"],
	[   "firstName": "John mobile", "phone": "222-2222"],
	[   "firstName": "Johny", "lastName": "mobile", "phone": "333-3333"],
	[   "firstName": "Johny2", "lastName": "mobile", "phone": "444-4444"],
	[   "firstName": "Sam", "phone": "777-7777"],
	[   "lastName": "Sam", "phone": "888-8888"]
]


let inArray = [
	["firstName": "Amike", "email": "", "phone": "608-242-7700", "lastName": ""],
	["firstName": "Amm", "email": "", "phone": "6082427700", "lastName": ""],
	["firstName": "Angie 😃 DNC‼️much", "contactID": "72F00819-EFF7-4931-95B9-6CCD8FDBA430:ABPerson", "email": "andstone1986@gmail.com", "lastName": "Bradshaw Stone", "phone": "(608) 213-5645"],
	["firstName": "Ann", "email": "annhome", "phone": "608-205-8505", "lastName": "Home"],
	["firstName": "Ann", "email": "annwork", "phone": "608-242-7700", "lastName": "Work"],
	["firstName": "Ax", "email": "", "phone": "", "lastName": ""],
	["firstName": "Daughter", "contactID": "E1237AA2-432E-4200-9ECE-1AF634F40018:ABPerson", "email": "no email", "lastName": "", "phone": "(608) 692-6132"],
	["firstName": "Frank", "contactID": "65D5BD5D-141E-4928-8DDB-9EF43F0FC5A8:ABPerson", "email": "hilscher.frank@gmail.com", "lastName": "Hilscher", "phone": "(608) 212-0731"],
	["firstName": "Jon", "contactID": "54F8AD25-B72C-4F57-8C6A-F460B01D474E", "email": "jonm4141@yahoo.com", "lastName": "", "phone": "(608) 220-8543"],
	["firstName": "Mike", "contactID": "32F768D9-2C12-4727-99C4-68C89D17B505", "email": "mike@derr.ws", "lastName": "Derr", "phone": "608 242-7700"],
	["firstName": "Mom", "contactID": "25C775B4-823F-424E-9CE4-FE8B55CEC18C", "email": "Mom <germangirl1988@gmail.com>", "lastName": "", "phone": "(608) 963-8347"],
	["firstName": "Mom", "contactID": "25C775B4-823F-424E-9CE4-FE8B55CEC18C", "email": "Mom <germangirl1988@gmail.com>", "lastName": "", "phone": "(608) 253-9390"],
	["firstName": "Sasha DNC Annastasia", "contactID": "F881F7AA-AAFA-40FE-A26A-B7902ADD013E", "email": "no email", "lastName": "", "phone": "+1 (608) 636-5205"],
	["firstName": "Tamra 😃😘💋bumble Lol", "contactID": "704E7D8D-4F34-4247-9C31-DE8F24648845:ABPerson", "email": "Teeandthree@yahoo.com", "lastName": "Hiles", "phone": "+1 (608) 473-4194"]
]



func findPeopleMatching(word1: String, word2: String, inArray: [[String: String]]) -> [[String: String]]? {
	
	var resultArray = [[String: String]]()
	
	var attributeValue = ""
	var namePredicate: NSPredicate?
	
	
	// First you look for an exact match: FirstName == FirstWord AND LastName == SecondWord
	
	resultArray = inArray.filter { $0["firstName"]?.lowercased() == word1.lowercased() && $0["lastName"]?.lowercased() == word2.lowercased() }
	
	if resultArray.count > 0 {
		
		print(resultArray[0]["phone"] ?? "phone")
		
		return resultArray
	}
	
	
	// If no match, look for a FirstName == "FirstWord SecondWord"
	
	resultArray = inArray.filter { $0["firstName"]?.lowercased() == word1.lowercased() + " " + word2.lowercased() }
	
	if resultArray.count > 0 {
		return resultArray
	}
	
	
	// If no match, look for FirstName == FirstWord OR LastName == SecondWord
	
	resultArray = inArray.filter { $0["firstName"]?.lowercased() == word1.lowercased() || $0["lastName"]?.lowercased() == word2.lowercased() }
	
	if resultArray.count > 0 {
		return resultArray
	}
	
	
	
	// If no match, look for FirstName Begins-With Word1
	
	attributeValue = word1 + "*";
	namePredicate = NSPredicate(format: "firstName like[c] %@", attributeValue)
	
	resultArray = inArray.filter { namePredicate!.evaluate(with: $0) };
	
	if resultArray.count > 0 {
		return resultArray
	}
	
	
	// If no match, look for LastName Begins-With Word2
	
	attributeValue = word2 + "*";
	namePredicate = NSPredicate(format: "lastName like[c] %@", attributeValue)
	
	resultArray = inArray.filter { namePredicate!.evaluate(with: $0) };
	
	if resultArray.count > 0 {
		return resultArray
	}
	
	
	// If no match, look for Word1 is Part-Of FirstName
	
	attributeValue = "*" + word1 + "*";
	namePredicate = NSPredicate(format: "firstName like[c] %@", attributeValue)
	
	resultArray = inArray.filter { namePredicate!.evaluate(with: $0) };
	
	if resultArray.count > 0 {
		return resultArray
	}
	
	
	// If no match, look for Word2 is Part-Of LastName
	
	attributeValue = "*" + word2 + "*";
	namePredicate = NSPredicate(format: "lastName like[c] %@", attributeValue)
	
	resultArray = inArray.filter { namePredicate!.evaluate(with: $0) };
	
	if resultArray.count > 0 {
		return resultArray
	}
	
	
	// NO matches found, so return nil
	
	return nil
}

var word1 = "tamra"
var word2 = ""

if let rv = findPeopleMatching(word1: word1, word2: word2, inArray: inArray) {
	
	if rv.count == 1 {
		
		print("\nFound Exactly ONE match! \n")
		
		// returned "rv" is still an array, even if it was a single match
		
		if let person = rv.first {
			print(person)
		}
		
	} else {
		
		// just printing them out to debug console here...
		// you'll need to write a "pick which one" function
		
		print("\nMultiple Matches found... \n")
		
		for person in rv {
			print(person)
		}
		
	}
	
} else {
	
	print("\n\t!!! Find People returned nil - ZERO matches found !!!!")
}

print("\n\n end")


class MyFirstConnection {
	var information: NSMutableArray?
}

var names = NSMutableArray(array: ["Joe", "Jim", "John", "Joseph", "Jason"])
var mix = NSMutableArray(array: ["Joe", "Jim", 96, "John", "Joseph", "Jason"])
//var names = ["Joe", "Jim", "Jason"]

var myfirstconnection = MyFirstConnection()
myfirstconnection.information = names

var myseconnection = MyFirstConnection()
myseconnection.information = mix

var pref = "Ja"

var idx = names.indexOfObject(passingTest:) { (ob, i, b) -> Bool in
	return (ob as! String).hasPrefix(pref)
}
print("A hmmm", idx)

idx = names.indexOfObject(passingTest:) { (ob, i, b) -> Bool in
	return (ob as! String).hasPrefix(pref)
}
print("B hmmm", idx)


if let iidx = (myseconnection.information?.indexOfObject(passingTest:) { (ob, i, b) -> Bool in
	print(i)
	if let strOB = ob as? String {
		return strOB.hasPrefix(pref)
	}
	return false
	})
{
	print("C2 hmmm", iidx)
	print("nf? ", iidx == NSNotFound)
}

idx = (myfirstconnection.information?.indexOfObject(passingTest:) { (ob, i, b) -> Bool in
	return (ob as! String).hasPrefix(pref)
	})!
print("C hmmm", idx)

if let theNames = myfirstconnection.information as? [String] {
	
	if let index = theNames.index(where: { $0.hasPrefix(pref) }) {
		print("y The first name starting with \(pref) was found at \(index)")
	}
	else {
		print("No names were found that start with \(pref)")
	}

}

		if let index = ((myfirstconnection.information) as! [String]).index(where: { $0.hasPrefix(pref) }) {
			print("X The first name starting with \(pref) was found at \(index)")
		}
		else {
			print("No names were found that start with \(pref)")
		}


//idx = myfirstconnection.information?.indexOfObject(passingTest:) { (ob, i, b) -> Bool in
//	return (ob as! String).hasPrefix(pref)
//}
//print("C hmmm", idx)
//

//if let nms = names as? [String] {
//	
//	if let index = nms.index(where: { $0.hasPrefix(pref) }) {
//		print("The first name starting with \(pref) was found at \(index)")
//	}
//	else {
//		print("No names were found that start with \(pref)")
//	}
//
//} else {
//	
//	if let nms = names as? NSMutableArray {
//	
//		let idx = nms.indexOfObject(passingTest:) { (ob, i, b) -> Bool in
//			return (ob as! String).hasPrefix(pref)
//		}
//		print(idx)
//	
//	}
//	
//}
//

//if names iskindofclass NSMutableArray {
//
//let idx = names.indexOfObject(passingTest:) { (ob, i, b) -> Bool in
//	return (ob as! String).hasPrefix(pref)
//}
//print(idx)
//
//} else {
//	
//
//if let index = names.index(where: { $0.hasPrefix(pref) }) {
//	print("The first name starting with \(pref) was found at \(index)")
//}
//else {
//	print("No names were found that start with \(pref)")
//}
//
//}

//let idx = names.indexOfObject(passingTest: (ob, index, Bool), in
//	return (ob as! String) == "Joe"
//)

//let n = names.indexesOfObjects(passingTest: <#T##(Any, Int, UnsafeMutablePointer<ObjCBool>) -> Bool#>)
//
//let index = names.index(where: { (item) -> Bool in
//	(item as String).hasPrefix(pref)
//})


//let index = cells.index(where: { (item) -> Bool in
//	item.foo == 42 // test if this is the item you're looking for
//})
