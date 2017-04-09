//
//  InterestPViewController.swift
//  scratchy
//
//  Created by Don Mini on 4/8/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class InterestPViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

	var delegate: IPSearch?
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	// MARK: - Table view data source
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 15
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
		
		cell.textLabel?.text = "\(indexPath)"
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("row selected", indexPath.row)
		delegate?.ipZoom(iPath: indexPath)
		presentingViewController?.dismiss(animated: true, completion: nil)
		self.navigationController?.popViewController(animated: true)
	}
	
}
