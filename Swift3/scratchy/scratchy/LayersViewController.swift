//
//  LayersViewController.swift
//  scratchy
//
//  Created by Don Mini on 4/8/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

extension UIImage {
	func imageWithColor(color: UIColor) -> UIImage? {
		let image = withRenderingMode(.alwaysTemplate)
		UIGraphicsBeginImageContextWithOptions(size, false, scale)
		color.set()
		image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return newImage
	}
}
extension UIView {
	func rotate(angle: CGFloat) {
		let radians = angle / 180.0 * CGFloat(M_PI)
		let rotation = self.transform.rotated(by: radians);
		self.transform = rotation
	}

	func createImage() -> UIImage? {
		
		let rect: CGRect = self.frame
		
		UIGraphicsBeginImageContext(rect.size)
		if let context: CGContext = UIGraphicsGetCurrentContext() {
			self.layer.render(in: context)
			let img = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			return img
		}
		
		return nil
	}
}

extension UIColor {

	convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
	
	convenience init(rgb: Int) {
		self.init(
			red: (rgb >> 16) & 0xFF,
			green: (rgb >> 8) & 0xFF,
			blue: rgb & 0xFF
		)
	}

	func lighter(by percentage:CGFloat=30.0) -> UIColor? {
		return self.adjust(by: abs(percentage) )
	}
	
	func darker(by percentage:CGFloat=30.0) -> UIColor? {
		return self.adjust(by: -1 * abs(percentage) )
	}
	
	func adjust(by percentage:CGFloat=30.0) -> UIColor? {
		var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
		if(self.getRed(&r, green: &g, blue: &b, alpha: &a)){
			return UIColor(red: min(r + percentage/100, 1.0),
			               green: min(g + percentage/100, 1.0),
			               blue: min(b + percentage/100, 1.0),
			               alpha: a)
		}else{
			return nil
		}
	}
}

class LayersViewController: UIViewController {

	@IBOutlet weak var theButton: UIButton!
	
	@IBAction func dbgTap(_ sender: Any) {
		print("stop here")
	}
	
	// A6BCE3, 244186, D2DDF1
	// FFE388, B28005, FFF0C1
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		var cColor = UIColor(red: 1.0, green: 0.95, blue: 0.77, alpha: 1.0)
		var pColor = UIColor(red: 1.0, green: 0.6, blue: 0, alpha: 1.0)
		var tColor = UIColor.white

		
		
		var r = CGRect.zero
		
		if let iconView = peopleIcon(cColor: cColor, pColor: pColor, tColor: tColor) {
		
			// position the view where you want it
			iconView.frame.origin.x = 140
			iconView.frame.origin.y = 240
			
			// add it to the main view
//			self.view.addSubview(iconView)

			r = iconView.bounds
		}

		
		
		if let iconImg = peopleIconImage(cColor: cColor, pColor: pColor, tColor: tColor) {
			
			theButton.backgroundColor = .clear
			theButton.setImage(iconImg, for: .normal)
			
		}

		let rt = true
		
		var clrs = [
			[0xFFF2C7, 0xFA9A09],
			[0xffcccc, 0xcc0000],
			[0xccffcc, 0x00cc00],
			[0xccccff, 0x0000cc]
		]
		
		var pt = CGPoint(x: 140, y: 140)

		for c in clrs {

//			let cc = UIColor(rgb: c)
			
			let cb = UIColor(rgb: c[0])
			let cm = UIColor(rgb: c[1])
			
			let lv = LayeredIcon(frame: r)
			lv.myInit(cColor: cb, pColor: cm, tColor: .white)

			lv.frame.origin = pt
			
			if rt {
				lv.rotate(angle: -30)
			}
			
			self.view.addSubview(lv)
			
			pt.x += 100
			
		}
		
		var cb = UIColor.black
		var cm = UIColor.black
		
		let lv = LayeredIcon(frame: r)
		lv.myInit(cColor: cb, pColor: cm, tColor: .black)
		
		lv.frame.origin = pt
		
		if rt {
			lv.rotate(angle: -30)
		}
		
		self.view.addSubview(lv)
		
		clrs = [
			[0xFFF2C7, 0xFA9A09],
			[0xFFF2C7, 0xcc0000],
			[0xFFF2C7, 0x00cc00],
			[0xFFF2C7, 0x0000cc]
		]
		
		pt = CGPoint(x: 140, y: 260)
		
		for c in clrs {
			
			//			let cc = UIColor(rgb: c)
			
			let cb = UIColor(rgb: c[0])
			let cm = UIColor(rgb: c[1])
			
			let lv = LayeredIcon(frame: r)
			lv.myInit(cColor: cb, pColor: cm, tColor: .white)
			
			lv.frame.origin = pt
			
			if rt {
				lv.rotate(angle: -30)
			}
			
			self.view.addSubview(lv)
			
			pt.x += 100
			
		}
		
		let c = clrs[0]
		 cb = UIColor(rgb: c[0])
		 cm = UIColor(rgb: c[1])
		

		let lvt = LayeredIcon(frame: r)
		lvt.myInit(cColor: cb, pColor: cm, tColor: .blue)
		
		lvt.frame.origin = pt
		
		if rt {
			lvt.rotate(angle: -30)
		}
		
		self.view.addSubview(lvt)
		

//		var c = UIColor()
//		
//		
//
//		lv.frame.origin = pt
//
//		self.view.addSubview(lv)
//
//		let lv2 = LayeredIcon(frame: r)
//		lv2.myInit(rgb: clrs[0])
//		
//		pt.x += r.width + 20
//		
//		lv2.frame.origin = pt
//		
//		self.view.addSubview(lv2)
		
//		let cTemplate = UIImage(named: "CircleTemplate")
//		let pTemplate = UIImage(named: "PeopleTemplate")
//		let tTemplate = UIImage(named: "TieTemplate")
//
//		// generate colored images from templates
//		var cImage = cTemplate?.imageWithColor(color: cColor)
//		var pImage = pTemplate?.imageWithColor(color: pColor)
//		var tImage = tTemplate?.imageWithColor(color: tColor)
//		
//
//		let c = UIImageView(image: cImage)
//		let p = UIImageView(image: pImage)
//		let t = UIImageView(image: tImage)
//		
//		let rv = UIView(frame: c.frame)
//
//		let pt = CGPoint(x: 240, y: 380)
//
//		rv.frame.origin = pt
//		
//		rv.addSubview(c)
//		rv.addSubview(p)
//		rv.addSubview(t)
//
//		self.view.addSubview(rv)
//		rv.rotate(angle: -30)
//		c.frame.origin = pt
//		p.frame.origin = pt
//		t.frame.origin = pt
//		
//		self.view.addSubview(c)
//		self.view.addSubview(p)
//		self.view.addSubview(t)
	}

	func peopleIcon(cColor: UIColor, pColor: UIColor, tColor: UIColor) -> UIView? {
		
		// create a view
		let iView = UIView()
		
		// load "template" images
		let cTemplate = UIImage(named: "CircleTemplate")
		let pTemplate = UIImage(named: "PeopleTemplate")
		let tTemplate = UIImage(named: "TieTemplate")
		
		// generate colored images from templates
		let cImage = cTemplate?.imageWithColor(color: cColor)
		let pImage = pTemplate?.imageWithColor(color: pColor)
		let tImage = tTemplate?.imageWithColor(color: tColor)
		
		// if this fails, the image load failed, so abort
		guard let sz = cTemplate?.size else { return nil }
		
		// size the view to the template image size
		iView.frame.size = sz
		
		// create the layers
		let cLayer = CALayer()
		cLayer.frame.size = sz
		cLayer.contents = cImage?.cgImage
		
		let pLayer = CALayer()
		pLayer.frame.size = sz
		pLayer.contents = pImage?.cgImage
		
		let tLayer = CALayer()
		tLayer.frame.size = sz
		tLayer.contents = tImage?.cgImage
		
		// add layers to view
		iView.layer.addSublayer(cLayer)
		iView.layer.addSublayer(pLayer)
		iView.layer.addSublayer(tLayer)
		
		return iView
		
	}
	
	func peopleIconImage(cColor: UIColor, pColor: UIColor, tColor: UIColor) -> UIImage? {
		
		// create a view
		let iView = UIView()
		
		// load "template" images
		let cTemplate = UIImage(named: "CircleTemplate")
		let pTemplate = UIImage(named: "PeopleTemplate")
		let tTemplate = UIImage(named: "TieTemplate")
		
		// generate colored images from templates
		let cImage = cTemplate?.imageWithColor(color: cColor)
		let pImage = pTemplate?.imageWithColor(color: pColor)
		let tImage = tTemplate?.imageWithColor(color: tColor)
		
		// if this fails, the image load failed, so abort
		guard let sz = cTemplate?.size else { return nil }
		
		// size the view to the template image size
		iView.frame.size = sz
		
		// create the layers
		let cLayer = CALayer()
		cLayer.frame.size = sz
		cLayer.contents = cImage?.cgImage
		
		let pLayer = CALayer()
		pLayer.frame.size = sz
		pLayer.contents = pImage?.cgImage
		
		let tLayer = CALayer()
		tLayer.frame.size = sz
		tLayer.contents = tImage?.cgImage
		
		// add layers to view
		iView.layer.addSublayer(cLayer)
		iView.layer.addSublayer(pLayer)
		iView.layer.addSublayer(tLayer)
		
		return iView.createImage()
		
	}
	
	func iconImage(cColor: UIColor, pColor: UIColor, tColor: UIColor) -> UIImage? {
		
		// create a view
		let iView = UIView()
		
		// load "template" images
		let cTemplate = UIImage(named: "CircleTemplate")
		let pTemplate = UIImage(named: "PeopleTemplate")
		let tTemplate = UIImage(named: "TieTemplate")
		
		// generate colored images from templates
		let cImage = cTemplate?.imageWithColor(color: cColor)
		let pImage = pTemplate?.imageWithColor(color: pColor)
		let tImage = tTemplate?.imageWithColor(color: tColor)
		
		// if this fails, the image load failed, so abort
		guard let sz = cTemplate?.size else { return nil }
		
		// size the view to the template image size
		iView.frame.size = sz
		
		// create the layers
		let cLayer = CALayer()
		cLayer.frame.size = sz
		cLayer.contents = cImage?.cgImage
		
		let pLayer = CALayer()
		pLayer.frame.size = sz
		pLayer.contents = pImage?.cgImage
		
		let tLayer = CALayer()
		tLayer.frame.size = sz
		tLayer.contents = tImage?.cgImage
		
		// add layers to view
		iView.layer.addSublayer(cLayer)
		iView.layer.addSublayer(pLayer)
		iView.layer.addSublayer(tLayer)
		
		return iView.createImage()
		
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
