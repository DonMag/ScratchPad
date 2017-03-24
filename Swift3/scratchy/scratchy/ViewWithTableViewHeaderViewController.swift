//
//  ViewWithTableViewHeaderViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/14/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ViewWithTableViewHeaderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var theTableView: UITableView!
	
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
				
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		sizeHeaderToFit()
	}
 
	func sizeHeaderToFit() {
		let headerView = theTableView.tableHeaderView!
		
		headerView.setNeedsLayout()
		headerView.layoutIfNeeded()
		
		let height = headerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
		
		var frame = headerView.frame
		frame.size.height = height
		headerView.frame = frame
		
		theTableView.tableHeaderView = headerView
	}
 
	// MARK: - Table view data source
	
	func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 14
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "theCell", for: indexPath)
	
		// Configure the cell...
		
		cell.textLabel?.text = "Row... \(indexPath)"
	
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
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
