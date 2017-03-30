//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


//struct Objects {
//	var sectionName: String!
//	var sectionObjects: [Brands]!
//}
//
//struct Brand {
//	var id: String!
//	var name: String!
//}
//
// var sortedLetters = [String]()
// var sortedBrands = [Brands]()
// var objectBrands = [Objects]()
//
//
//var allBrands: [Brands] = [
//	Brands(id: "1", name: "Z Brand")
//	]
//
//allBrands.append(Brands(id: "1", name: "C Brand"))
//allBrands.append(Brands(id: "2", name: "L Brand"))
//allBrands.append(Brands(id: "3", name: "M Brand"))
//allBrands.append(Brands(id: "4", name: "F Brand"))
//allBrands.append(Brands(id: "5", name: "D Brand"))
//allBrands.append(Brands(id: "6", name: "A Brand"))
//allBrands.append(Brands(id: "7", name: "C Brand"))
//allBrands.append(Brands(id: "8", name: "C Brand"))
//allBrands.append(Brands(id: "9", name: "C Brand"))
//allBrands.append(Brands(id: "10", name: "C Brand"))
//allBrands.append(Brands(id: "11", name: "C Brand"))
//allBrands.append(Brands(id: "12", name: "C Brand"))
//allBrands.append(Brands(id: "13", name: "C Brand"))
//allBrands.append(Brands(id: "14", name: "C Brand"))
//

//objectBrands.append(Brands(id: "1", name: "C Brand"))

struct Brand {
	var id: String!
	var name: String!
}

var aBrands: [Brand] = [
	Brand(id: "8925", name: "Chrysler"),
	Brand(id: "8121", name: "Dodge"),
	Brand(id: "3943", name: "Jeep"),
	Brand(id: "2878", name: "Ram"),
	Brand(id: "1893", name: "Ford"),
	Brand(id: "9318", name: "Lincoln"),
	Brand(id: "1253", name: "Buick"),
	Brand(id: "4799", name: "Cadillac"),
	Brand(id: "2918", name: "Chevrolet"),
	Brand(id: "6603", name: "GMC"),
	Brand(id: "9743", name: "Tesla Motors"),
	Brand(id: "9429", name: "Hennessey"),
	Brand(id: "5028", name: "Acura"),
	Brand(id: "7276", name: "Honda"),
	Brand(id: "6929", name: "Toyota"),
	Brand(id: "1202", name: "Lexus"),
	Brand(id: "1901", name: "Mitsubishi"),
	Brand(id: "9199", name: "Suzuki"),
	Brand(id: "5902", name: "Mazda"),
	Brand(id: "8889", name: "Subaru"),
	Brand(id: "2805", name: "Scion"),
	Brand(id: "2415", name: "Ferrari"),
	Brand(id: "1157", name: "Maserati"),
	Brand(id: "1239", name: "Lamborghini"),
	Brand(id: "1938", name: "Lancia"),
	Brand(id: "9078", name: "Porsche"),
	Brand(id: "5786", name: "Saab"),
	Brand(id: "4728", name: "BMW"),
	Brand(id: "2341", name: "Mercedes-Benz"),
	Brand(id: "1232", name: "Volkswagon"),
	Brand(id: "9307", name: "Bugatti"),
	Brand(id: "2279", name: "Volvo")
]

aBrands.sort(by: { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending })

var sections : [(index: Int, length :Int, title: String)] = Array()


var index = 0;

for i in 0...aBrands.count - 1 {
	
	let commonPrefix = aBrands[i].name.commonPrefix(with: aBrands[index].name, options: .caseInsensitive)
	
	if commonPrefix.characters.count == 0 {
	
		let string = aBrands[index].name.uppercased();
		
		let firstCharacter = string[string.startIndex]
		
		let title = "\(firstCharacter)"
		
		let newSection = (index: index, length: i - index, title: title)
		
		sections.append(newSection)
		
		index = i;
		
	}
	
}

print(sections)

//var s = "Chrysler, Dodge, Jeep, Ram, Ford, Lincoln, Buick, Cadillac, Chevrolet, GMC, Tesla Motors, Hennessey, Acura, Honda, Toyota, Lexus, Mitsubishi, Suzuki, Mazda, Subaru, Scion, Ferrari, Maserati, Lamborghini, Lancia, Porsche, Saab, BMW, Mercedes-Benz, Volkswagon, Bugatti, Volvo"
//
//var a = s.components(separatedBy: ", ")
//
//for t in a {
//	let n = arc4random_uniform(8999) + 1000
//	print("Brand(id: \"\(n)\", name: \"\(t)\"),")
//}
