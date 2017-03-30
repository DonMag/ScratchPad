//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

var imageList = ["flower", "balloon", "cat", "dog"]
var t = imageList[2]
var i = imageList.count

// two-dimensional array
// should be your Event object...  mArray = [[Event]]()
var mArray = [[String]]()

// simulate your allEvents array
var allEvents = ["a 1", "a 2", "a 3", "b 1", "b 2", "c 1", "c 2", "d 1", "d 2", "d 3", "d 4"]

// get first "Day"
// yours will be something like:  currentDay = getDateFrom(allEvents[0])
var currentDay = "\(allEvents[0].characters.first)"

// init empty array
// yours will be Event objects...  currentEvents = [Event]()
var currentEvents = [String]()

for event in allEvents {

	// yours will be something like:   thisDay = getDateFrom(event)
	var thisDay = "\(event.characters.first)"
	
	if thisDay != currentDay || event == allEvents.last {
		
		mArray.append(currentEvents)
		
		currentDay = thisDay
		
		// reset currentEvents array:  currentEvents = [Event]()
		currentEvents = [String]()
		
	}
	
	currentEvents.append(event)
	
}

print(mArray)

mArray = [[String]]()

// get first "Day"
// yours will be something like:  currentDay = getDateFrom(allEvents[0])
currentDay = "\(allEvents[0].characters.first)"

// init empty array
// yours will be Event objects...  currentEvents = [Event]()
currentEvents = [String]()

for event in allEvents {
	
	// yours will be something like:   thisDay = getDateFrom(event)
	var thisDay = "\(event.characters.first)"
	
	if thisDay != currentDay {
		
		mArray.append(currentEvents)
		
		currentDay = thisDay
		
		// reset currentEvents array:  currentEvents = [Event]()
		currentEvents = [String]()
		
		currentEvents.append(event)
		
	} else if event == allEvents.last {
		
		currentEvents.append(event)
		
		mArray.append(currentEvents)
		
	} else {
		
		currentEvents.append(event)
		
	}
	
	
}

print(mArray)

