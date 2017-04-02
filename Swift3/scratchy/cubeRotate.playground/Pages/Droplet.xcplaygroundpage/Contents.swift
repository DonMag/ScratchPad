//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport



let cView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
cView.backgroundColor = UIColor.blue


let drop = UIImage(named: "iconOutline")
let vDrop = UIImageView(image: drop)
let vDrop2 = UIImageView(image: drop)

vDrop2.frame = vDrop2.frame.insetBy(dx: 0, dy: 40)
vDrop2.frame.origin.x += vDrop2.frame.size.width

let v1 = UIView(frame: vDrop.frame)

var maskL = CALayer()
maskL.contents = drop?.cgImage
maskL.frame = vDrop.frame //.insetBy(dx: -4, dy: -4)

maskL.backgroundColor = UIColor.white.cgColor

var maskT = CALayer()
maskT.contents = drop?.cgImage
maskT.frame = vDrop.frame.insetBy(dx: 20, dy: 40)

vDrop.layer.addSublayer(maskL)
vDrop.layer.mask = maskT

//cView.addSubview(vDrop)

//cView.addSubview(vDrop2)




let image = UIImage(named: "iconOutline")

var sz = image?.size
sz?.width += 80
sz?.height += 80

var size = sz //sz!.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))

let hasAlpha = true
let scale: CGFloat = 0.0 // Automatically use scale factor of main screen

UIGraphicsBeginImageContextWithOptions(size!, !hasAlpha, scale)
image?.draw(in: CGRect(origin: CGPoint.zero, size: size!))

let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()


var v = UIView(frame: CGRect(origin: CGPoint.zero, size: sz!))
v.backgroundColor = UIColor.white


//var vmask = CALayer()
//vmask.contents = scaledImage?.cgImage
//maskT.frame = v.frame


var scIV = UIImageView(image: drop)
scIV = UIImageView(image: scaledImage)

scIV.layer.mask = maskT

//v.layer.mask = maskT
//v.mask = scIV

cView.addSubview(scIV)


PlaygroundPage.current.liveView = cView
