//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//extension String {
//	var date: String? {
//		let format = NSDateFormatter()
//		format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//		format.timeZone = NSTimeZone(forSecondsFromGMT: 0)
//		let d = format.dateFromString(self)
//		return format.stringFromDate(d!) // format.dateFromString(self)
//	}
//}
//
//"2016-05-12T18:30:00.000Z".date
////prints "May 12, 2016, 2:30 PM"
//
//var date = "2016-05-12T18:30:00.000Z"
//
//let format = NSDateFormatter()
//format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//format.timeZone = NSTimeZone(forSecondsFromGMT: 60*60*4)
////format.timeZone = NSTimeZone(abbreviation: "UTC")
//
//var d = format.dateFromString(date)
//
//var s = format.stringFromDate(d!)
//
////return format.dateFromString(self)


extension String {
	var date: NSDate? {
		let format = DateFormatter()
		format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		format.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone!
		return format.date(from: self) as NSDate?
	}
}

var dateVal = "2016-05-12T18:30:00.000Z".date
//prints "May 12, 2016, 2:30 PM"

dateVal = NSDate()

let newFormat = DateFormatter()
newFormat.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone!
newFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

//print(newFormat.string(from: dateVal! as Date))

//

var newDateString : String = ""

//let dateFormatter = DateFormatter()
//dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//
//// set tonightDate to 1 minute before midnight, tonight, in local time
//if let tonightDate = dateFormatter.date(from: "2017-03-14 23:59") {
//
//	// set nowDate to current local time
//	let nowDate = Date()
//
//	let comp = nowDate.compare(tonightDate)
//	
//	if comp.rawValue <= 0 {
//		newDateString = "TONIGHT"
//	} else {
//		dateFormatter.dateFormat = "EEEE, MMMM d, yyyy"
//		newDateString = dateFormatter.string(from: tonightDate)
//	}
//
//}
//
//print(newDateString)


//func isNowBeforeEvent(eventDateTime: String) -> Int {
//	
//	let dateFormatter = DateFormatter()
//	dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//
//	guard let tonightDate = dateFormatter.date(from: "2017-03-14 23:59") else { return -1 }
//	
//	let nowDate = Date()
//	
//	if nowDate.compare(tonightDate) <= 0 {
//		return 1
//	}
//	
//	return 0
//}



public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
	return lhs === rhs || lhs.compare(rhs as Date) == .orderedSame
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
	return lhs.compare(rhs as Date) == .orderedAscending
}

extension NSDate: Comparable { }


let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

if let tonightDate = dateFormatter.date(from: "2017-03-14 23:59") {

	if Date() <= tonightDate {
		print("Tonight")
	} else {
		dateFormatter.dateFormat = "EEEE, MMMM d, yyyy"
		print(dateFormatter.string(from: tonightDate))
	}
	
}

func stringToDate(DateString dateString: String) -> NSDate? {
	let dateFormatter = DateFormatter()
	dateFormatter.dateFormat = "yyyyMMddHHmmss"
	dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
	dateFormatter.timeZone = TimeZone(abbreviation: "EST")
	
	if let date = dateFormatter.date(from: dateString) {
		return date as NSDate?
	}
	
	return nil
	
}

let dateString = "20150909093700"

let returnedDate = stringToDate(DateString: dateString)

print("Date without formatting or Time Zone: [", returnedDate ?? "return was nil", "]")

let dFormatter = DateFormatter()
dFormatter.timeZone = TimeZone(abbreviation: "EST")
dFormatter.dateStyle = .full
dFormatter.timeStyle = .full

print("Result with formatting and Time Zone: [", dFormatter.string(from: returnedDate as! Date), "]")



