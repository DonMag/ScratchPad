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

let n = Int((3 + 5))

//
PlaygroundPage.current.liveView = navigationController.view
PlaygroundPage.current.needsIndefiniteExecution = true

