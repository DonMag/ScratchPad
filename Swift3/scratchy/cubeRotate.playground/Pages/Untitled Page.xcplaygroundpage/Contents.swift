//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport



let view = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
view.backgroundColor = UIColor.blue

var car = UIImage(named: "car")
var carView = UIImageView(image: car)
carView.backgroundColor = UIColor.purple

view.addSubview(carView)


let img = UIImage(named: "hole")
let img2 = UIImage(named: "hole")

let v = UIImageView(image: img)
let v2 = UIImageView(image: img)

v2.frame = v2.frame.insetBy(dx: 20, dy: 80)


view.addSubview(v)

//v.backgroundColor = UIColor.clear

//var maskLayer = CALayer()
//maskLayer.frame = v.frame
//maskLayer.contents = img?.cgImage
//
//
//
//
//var whiteLayer = CALayer()
//whiteLayer.frame = v2.frame
//	
//whiteLayer.backgroundColor = UIColor.white.cgColor
//
////whiteLayer.mask = maskLayer
//
//
//
//carView.layer.mask = maskLayer
//
//
//
//carView.layer.addSublayer(whiteLayer)
//



PlaygroundPage.current.liveView = view
