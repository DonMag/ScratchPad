//: [Previous](@previous)

import Foundation

import UIKit
import SceneKit
import PlaygroundSupport

import UIKit
import PlaygroundSupport

class TableViewController: UITableViewController {
	
	override func viewDidLoad() {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
		
		cell.textLabel?.text = "Row: \(indexPath.row)"
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let next = TableViewController()
		next.title = "Row: \(indexPath.row)"
		navigationController?.pushViewController(next, animated: true)
		
		print(navigationController?.viewControllers.count ?? "Hö?")
	}

}


var d = Date()
print(d)
d += 60
print(d)

let tableViewController = TableViewController()
tableViewController.title = "start"
let navigationController = UINavigationController(rootViewController: tableViewController)

navigationController.view.frame.size = CGSize(width: 320, height: 400)
navigationController.navigationBar.barTintColor = UIColor.white

let n = Int((3 + 5))

//
PlaygroundPage.current.liveView = navigationController.view
PlaygroundPage.current.needsIndefiniteExecution = true

