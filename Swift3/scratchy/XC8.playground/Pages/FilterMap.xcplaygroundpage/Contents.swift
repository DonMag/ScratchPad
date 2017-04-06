

import UIKit
import PlaygroundSupport


let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
//
container.backgroundColor = UIColor.green

PlaygroundPage.current.liveView = container

class AccelerationData {
	var timestamp: Int64 = 0 // in milliseconds
	var x: Double = 0.0
	var y: Double = 0.0
	var z: Double = 0.0
	
	var timestampDate: Date {
		return Date(milliseconds: timestamp)
	}
	
	var JSONDictionary: [String: Any] {
		let jsonDictionary: [String: Any] = [
			"X": x,
			"Y": y,
			"Z": z,
			"TIME": timestamp
		]
		return jsonDictionary
	}
}

extension Date {
	
	var milliseconds: Int64 {
		return Int64(self.timeIntervalSince1970 * 1000)
	}
	
	init(milliseconds: Int64) {
		self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
	}
	
}

func mtimeFilter(delta: Int64) -> (Int64) -> Bool {
	var nextTimeStamp = Int64.min
	return { timeStamp in
		if timeStamp >= nextTimeStamp {
			if nextTimeStamp == Int64.min {
				nextTimeStamp = timeStamp
			}
			nextTimeStamp += delta
			return true
		} else {
			return false
		}
	}
}

func timeFilter(delta: Int64) -> (Int64) -> Bool {
	var nextTimeStamp: Int64?
	return { timeStamp in
		if let next = nextTimeStamp {
			if timeStamp >= next {
				nextTimeStamp = next + delta
				return true
			} else {
				return false
			}
		} else {
			// First call:
			nextTimeStamp = timeStamp + delta
			return true
		}
	}
}

var myRecords = [AccelerationData]()

var d = Date().milliseconds

for idx in 1...2 {		// 1...200
	
	let r = AccelerationData()
	r.timestamp = Int64(d + idx * 1600)
	
	myRecords.append(r)
	
}

let filteredArr = myRecords.filter {(
	$0.timestamp % 500 < 20
)}

print(filteredArr.count)

let filter = timeFilter(delta: 500)
let reducedMeasurements = myRecords.filter { filter($0.timestamp) }

print(reducedMeasurements.count)

var loopMeasurements = [AccelerationData]()

var nextTimeStamp = myRecords.first!.timestamp // Assuming that the array is not empty
for accData in myRecords {
	if accData.timestamp >= nextTimeStamp {
		loopMeasurements.append(accData)
		nextTimeStamp += 500 // add 0.5 seconds
	}
}

print(loopMeasurements.count)

for accData in loopMeasurements {
	print(accData.timestamp)
}
