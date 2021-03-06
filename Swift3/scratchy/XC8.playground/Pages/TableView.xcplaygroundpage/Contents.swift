//: [Previous](@previous)

import Foundation

import UIKit
import PlaygroundSupport

class rndCell: UITableViewCell {
	
	var myLabel1: UILabel!
	var myLabel2: UILabel!
	var myBKGView: UIView!
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:)")
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		let gap : CGFloat = 10
		let labelHeight: CGFloat = 30
		let labelWidth: CGFloat = 150
		let lineGap : CGFloat = 5
		let label2Y : CGFloat = gap + labelHeight + lineGap
		
		
		let v = UIView(frame: CGRect.zero)
		v.backgroundColor = UIColor.red
		v.translatesAutoresizingMaskIntoConstraints = false

		
		contentView.addSubview(v)
		
		v.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
		v.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
		v.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		v.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

		
		myBKGView = v
		
		myLabel1 = UILabel()
		myLabel1.frame = CGRect(x: gap, y: gap, width: labelWidth, height: labelHeight)
// CGRectMake(gap, gap, labelWidth, labelHeight)
		myLabel1.textColor = UIColor.black
		contentView.addSubview(myLabel1)
		
		myLabel2 = UILabel()
		myLabel2.frame = CGRect(x: gap, y: label2Y, width: labelWidth, height: labelHeight)
//CGRectMake(gap, label2Y, labelWidth, labelHeight)
		myLabel2.textColor = UIColor.blue
		contentView.addSubview(myLabel2)
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		myBKGView.layer.cornerRadius = myBKGView.frame.height / 2
	}
	
}

class TableViewController: UITableViewController {
	
	override func viewDidLoad() {
//		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		tableView.register(rndCell.self, forCellReuseIdentifier: "Cell")
		tableView.contentInset.top = 76.0
		tableView.backgroundColor = UIColor.clear
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	
		var r = tableView.bounds
		
		
		let wImg = UIImage(named: "wtran")
		let bImg = UIImage(named: "bt")
		
		let imgLayer = CALayer()
		imgLayer.contents = bImg?.cgImage
		
		r.size = (bImg?.size)!
		imgLayer.frame = r
		
		tableView.superview?.layer.mask = imgLayer
		
//		let theLayer = CAShapeLayer()
////		theLayer.backgroundColor = UIColor.orange.cgColor
//		
//		theLayer.frame = r
//
//		r.size.height = 260
//		r.origin.x = 40
//		r.size.width -= 80
//		
////		let pth = UIBezierPath()
////		pth.move(to: CGPoint(x: 0, y: 0))
////		pth.addLine(to: CGPoint(x: 200, y: 0))
////		pth.addLine(to: CGPoint(x: 200, y: 100))
////		pth.addLine(to: CGPoint(x: 0, y: 100))
////		pth.close()
//
//		let pth = CGPath(rect: r, transform: nil)
//		
//		theLayer.path = pth
//		theLayer.fillColor = UIColor.gray.cgColor
////		theLayer.fillRule = kCAFillRuleNonZero
//		
//		tableView.layer.mask = theLayer
		
//		tableView.superview?.layer.mask = theLayer
		
		
//		let theLayer = CALayer()
//		var r = tableView.frame
////		r.size.height = 176
//		theLayer.frame = r // CGRect(x: 0, y: 0, width: tableView.frame.width, height: 76) //CGRectMake(0, 0, self.tableView.frame.width, 76)
//		var clr = UIColor(white: 0.0, alpha: 0.5)  // UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
//		theLayer.backgroundColor = clr.cgColor
//		
//		r.size.height = 100
//		
//		var pth = CGPath(rect: r, transform: nil)
//		
//		
//		
//		tableView.superview?.layer.mask = theLayer

		
//		tableView.superview?.layer.addSublayer(theLayer)

//		r.origin.y = 76
//		
//		let theGradLayer = CAGradientLayer()
//		theGradLayer.frame = r
//		
//		var trC = UIColor.darkGray.cgColor
//		var opC = UIColor.clear.cgColor
//		
//		theGradLayer.colors = [trC, trC, opC, opC]
//		theGradLayer.locations = [0.0, 0.31, 0.31, 1]
//		
//		tableView.superview?.layer.mask = theGradLayer
		
//		tableView.superview?.layer.addSublayer(theGradLayer)
		
//		CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//		gradientLayer.frame = self.tableView.frame;
		
//		id transparent = (id)[UIColor clearColor].CGColor;
//		id opaque = (id)[UIColor blackColor].CGColor;
//		gradientLayer.colors = @[transparent, opaque, opaque];
//		gradientLayer.locations = @[@0.1, @0.11, @1];
//		self.tableView.superview.layer.mask = gradientLayer;

		
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 15
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! rndCell
		
		cell.myLabel1.text = "Sec: \(indexPath.section)"
		cell.myLabel2.text = "Row: \(indexPath.row)"
//		cell.textLabel?.text = "Row: \(indexPath.row)"
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let next = TableViewController()
		next.title = "Row: \(indexPath.row)"
		navigationController?.pushViewController(next, animated: true)
		
		print(navigationController?.viewControllers.count ?? "Hö?")
	}

}



let tableViewController = TableViewController()
tableViewController.title = "start"
let navigationController = UINavigationController(rootViewController: tableViewController)

navigationController.view.frame.size = CGSize(width: 320, height: 400)
navigationController.navigationBar.barTintColor = UIColor.white
navigationController.view.backgroundColor = UIColor.green




//
PlaygroundPage.current.liveView = navigationController.view
PlaygroundPage.current.needsIndefiniteExecution = true

