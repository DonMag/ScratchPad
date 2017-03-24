//
//  ContainersViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/24/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ContainersViewController: UIViewController {

	@IBOutlet weak var mapContainer: UIView!
	@IBOutlet weak var tableContainer: UIView!
	
	
	@IBAction func showContainer(_ sender: UISegmentedControl) {
		if sender.selectedSegmentIndex == 0 {
			UIView.animate(withDuration: 0.5, animations: {
				self.tableContainer.alpha = 1
				self.mapContainer.alpha = 0
			})
			
		}else {
			UIView.animate(withDuration: 0.5, animations: {
				self.tableContainer.alpha = 0
				self.mapContainer.alpha = 1
			})
		}
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
