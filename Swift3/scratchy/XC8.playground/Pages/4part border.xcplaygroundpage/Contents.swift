//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport


var screenSize = CGSize(width: 600, height: 600)

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
containerView.backgroundColor = UIColor.lightGray


let backgroundView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
backgroundView.backgroundColor = UIColor.clear
backgroundView.clipsToBounds = false

let bgvFrame = backgroundView.bounds

let leftEdge = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: bgvFrame.size.height))
leftEdge.backgroundColor = UIColor.black

let topEdge = UIView(frame: CGRect(x: 0, y: 0, width: bgvFrame.size.width, height: 3))
topEdge.backgroundColor = UIColor.black

let rightEdge = UIView(frame: CGRect(x: bgvFrame.size.width - 3, y: 0, width: 3, height: bgvFrame.size.height))
rightEdge.backgroundColor = UIColor.black

let bottomEdge = UIView(frame: CGRect(x: 0, y: bgvFrame.size.height - 3, width: bgvFrame.size.width, height: 3))
bottomEdge.backgroundColor = UIColor.black

backgroundView.addSubview(leftEdge)
backgroundView.addSubview(topEdge)
backgroundView.addSubview(rightEdge)
backgroundView.addSubview(bottomEdge)

let cView = UIView(frame: CGRect(x: -50, y: -50, width: 100, height: 100))
cView.backgroundColor = UIColor.yellow

backgroundView.addSubview(cView)

containerView.addSubview(backgroundView)

PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true


