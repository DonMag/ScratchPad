import Foundation
import UIKit
import PlaygroundSupport

let contentRect = CGRect(x: 0, y: 0, width: 400, height: 400)
let contentView = UIView(frame: contentRect)
contentView.backgroundColor = .white

let image = UIImage(named: "swiftBlue.png")
let imageView = UIImageView(image: image)
imageView.contentMode = .scaleAspectFill

let blur = UIBlurEffect(style: .light)
let blurView = UIVisualEffectView(effect: blur)
blurView.frame = imageView.frame


func getCPath(r: CGRect) -> CGPath {
	let rp = UIBezierPath(rect: r)
	let cp = UIBezierPath(ovalIn: r)
	rp.append(cp)
	return rp.cgPath
}

func getRPath(r: CGRect) -> CGPath {
	return UIBezierPath(rect: r).cgPath
}

contentView.addSubview(imageView)

contentView.addSubview(blurView)

let maskLayer = CAShapeLayer()
maskLayer.frame = imageView.bounds
maskLayer.fillColor = UIColor.green.cgColor

let pth = UIBezierPath(roundedRect: imageView.bounds.insetBy(dx: 100, dy: 100), cornerRadius: 50)
pth.append(UIBezierPath(rect: imageView.bounds))

let anim = CABasicAnimation(keyPath: "path")

anim.fromValue = maskLayer.path

anim.toValue = pth.cgPath

anim.duration = 5.0

anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

maskLayer.add(anim, forKey: nil)

blurView.layer.mask = maskLayer

CATransaction.begin()
CATransaction.setDisableActions(true)
maskLayer.path = pth.cgPath
CATransaction.commit()


//let hole = CAShapeLayer()
//
//hole.path = getRPath(r: CGRect(x: 50, y: 50, width: 100, height: 100))
//
//hole.path = getRPath(r: imageView.frame)
//
//hole.fillColor = UIColor.green.cgColor
//hole.fillRule = kCAFillRuleEvenOdd
//
//let animation = CABasicAnimation(keyPath: "path")
//animation.duration = 4
////animation.toValue = getCPath(r: CGRect(x: 50, y: 50, width: 100, height: 100))
//
//animation.toValue = getCPath(r: imageView.frame)
//
//hole.add(animation, forKey: "path")
//
//
//let mask = UIView(frame: contentRect)
////mask.backgroundColor = UIColor.red
//
//contentView.addSubview(imageView)
//
//contentView.addSubview(blurView)
//
////blurView.layer.addSublayer(hole)
//blurView.layer.mask = hole

//mask.layer.addSublayer(hole)

//blurView.mask = mask

PlaygroundPage.current.liveView = contentView
PlaygroundPage.current.needsIndefiniteExecution = true





//let animation = CABasicAnimation(keyPath: "path")
////animation.fromValue = hole.path
//animation.toValue = toCircle.cgPath
//animation.duration = 2
//mask.layer.add(animation, forKey: "path")

//animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
//hole.add(animation, forKey: nil)
//
//CATransaction.begin()
//CATransaction.disableActions()
//hole.path = toPath.cgPath
//CATransaction.commit()
//
