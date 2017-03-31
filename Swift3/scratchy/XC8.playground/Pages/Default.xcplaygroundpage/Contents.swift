
import UIKit
import PlaygroundSupport


let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 400))
//
container.backgroundColor = UIColor.green

let d = Date()

print(d)

let calendar = NSCalendar.current
var componentsNow = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: d)

let month = componentsNow.month

print(month ?? "X")

let n = "7E392C50-9E1D-494A-AE0F-1BA08B18D977".characters.count

PlaygroundPage.current.liveView = container
//PlaygroundPage.current.needsIndefiniteExecution = true
