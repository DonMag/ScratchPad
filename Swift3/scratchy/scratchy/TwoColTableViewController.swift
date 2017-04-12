//
//  TwoColTableViewController.swift
//  scratchy
//
//  Created by Don Mag on 4/12/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class TwoColTableViewController: UITableViewController {
	
	var theData = [
		["Bool Field with a long field name to show how labels wrap to a new line", "No"],
		["This is longer text in the label", "This is short"],
		["Field with long \"off\" label", "Fruitcake, fruitcake, sweet topping. Croissant cake jujubes ice cream."],
		["Field with long labels", "Chupa chups chocolate bar chocolate cake apple pie gingerbread croissant chocolate cake."],
		["Short Left", "Short Right"],
		["Short Left", "Long Right so we can see what happens in this case."],
		["Long Left label, but not *too* long", "Long Right label, but not *too* long."],
		["Long Left label, but not *too* long", "Long Right label that is just a little longer."],
		["Long Left label, it's a wrap", "Long Right label, but not *too* long."],
		["Long Left... this should be the longest \"Left\" side label in this demonstration table data.", "Short Right"],
		nil
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.estimatedRowHeight = 68.0
		tableView.rowHeight = UITableViewAutomaticDimension
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		tableView.beginUpdates()
		tableView.endUpdates()
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 40 // theData.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "twoColCell", for: indexPath) as! TwoColTableViewCell
		//		let cell = tableView.dequeueReusableCell(withIdentifier: "stackViewCell", for: indexPath) as! TwoColTableViewCell
		
		// Configure the cell...
		
		if indexPath.row < theData.count {
			
			cell.leftLabel.text = theData[indexPath.row]?[0] ?? "Item \(indexPath.row)"
			cell.rightLabel.text = theData[indexPath.row]?[1] ?? "Just some filler text."
			
		} else {
			
			cell.leftLabel.text = "Item \(indexPath.row)"
			cell.rightLabel.text = "Just some filler text."
			
		}
		
		return cell
	}
	
	
}
