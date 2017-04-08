//
//  TestTableViewController.swift
//  CustomBarButton
//
//  Created by DonMag on 4/7/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

protocol MyCellDelegate {
	func pressedButtonForMyCell(theSender: MyCell)
}

class MyCell: UITableViewCell {
	
	@IBOutlet weak var theLabel: UILabel!
	@IBOutlet weak var theButton: UIButton!
	
	var delegate: MyCellDelegate?
	
	@IBAction func childScreenButton(sender: AnyObject) {
		delegate?.pressedButtonForMyCell(theSender: self)
	}
	
}

class TestTableViewController: UITableViewController, MyCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 10
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell

		cell.theLabel.text = "\(indexPath)"
		cell.delegate = self

        return cell
    }
	
	func pressedButtonForMyCell(theSender: MyCell) {
		print("delegate called", theSender)
	}

}
