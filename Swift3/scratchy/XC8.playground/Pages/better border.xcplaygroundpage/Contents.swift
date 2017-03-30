//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


//import Foundation
import UIKit
import PlaygroundSupport


var screenSize = CGSize(width: 600, height: 600)

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
containerView.backgroundColor = UIColor.lightGray




let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
backgroundView.backgroundColor = UIColor.clear
backgroundView.clipsToBounds = false
backgroundView.layer.borderWidth = 3


//backgroundView.mask(withRect: backgroundView.bounds.insetBy(dx: 3, dy: 3), inverse: true)

let bView = UIView(frame: backgroundView.bounds.insetBy(dx: 3, dy: 3))
bView.backgroundColor = UIColor.red

let cView = UIView(frame: CGRect(x: -50, y: -50, width: 100, height: 100))
cView.backgroundColor = UIColor.yellow

//bView.addSubview(cView)

//backgroundView.addSubview(cView)


let bgContain = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))

backgroundView.frame.origin.x = 50
backgroundView.frame.origin.y = 50
cView.frame.origin.x = 0
cView.frame.origin.y = 0

bgContain.addSubview(backgroundView)
bgContain.addSubview(cView)

containerView.addSubview(bgContain)

PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true


