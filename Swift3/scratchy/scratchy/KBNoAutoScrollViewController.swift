//
//  KBNoAutoScrollViewController.swift
//  scratchy
//
//  Created by Don Mag on 4/5/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class KBNoAutoScrollViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var theTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//		theTable.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	// MARK: - Table view data source
	
	 func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}
	
	 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return 15
	}
	
	 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "kbCellB", for: indexPath) as! KBAutoScrollCell
		
		// Configure the cell...
		
		cell.theTextField.text = "\(indexPath)"
		
		return cell
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
