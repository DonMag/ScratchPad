
import UIKit
import PlaygroundSupport

let container = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 700))
//
container.backgroundColor = UIColor.green

let v = UIView(frame: CGRect(x: 100, y: 100, width: 300, height: 300))
v.backgroundColor = UIColor.yellow

let shp = CAShapeLayer()
shp.bounds = v.bounds
let pth = UIBezierPath()
pth.move(to: CGPoint(x: 20, y: 220))
pth.addLine(to: CGPoint(x: 20, y: 40))
pth.addLine(to: CGPoint(x: 40, y: 80))
pth.addLine(to: CGPoint(x: 120, y: 40))
pth.addLine(to: CGPoint(x: 140, y: 40))
pth.close()
shp.strokeColor = UIColor.orange.cgColor
shp.fillColor = UIColor.cyan.cgColor
shp.lineWidth = 3.0

shp.lineDashPattern = [5, 5]

shp.path = pth.cgPath
shp.position = CGPoint(x: 150, y: 150)
v.layer.addSublayer(shp)

container.addSubview(v)

let dashAnim = CABasicAnimation(keyPath: "lineDashPhase")
dashAnim.fromValue = 0
dashAnim.toValue = 15
dashAnim.duration = 0.75
dashAnim.repeatCount = 10000

shp.add(dashAnim, forKey: "lineDashPhase")

PlaygroundPage.current.liveView = container
PlaygroundPage.current.needsIndefiniteExecution = true


