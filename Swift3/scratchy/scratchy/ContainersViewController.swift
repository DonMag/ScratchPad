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
	
	var vcA: ContainerAViewController?
	var vcB: ContainerBViewController?
	
	@IBAction func showContainer(_ sender: UISegmentedControl) {
		
		print(vcA?.theLabel.text ?? "Missing A")
		print(vcB?.theLabel.text ?? "Missing B")
		
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
    
	@IBAction func buttonTapped(_ sender: Any) {
	}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if segue.identifier == "segToA" {
			
			if let vc = segue.destination as? ContainerAViewController {
				vcA = vc
			}
			
		}
		
		if segue.identifier == "segToB" {
		
			if let vc = segue.destination as? ContainerBViewController {
				vcB = vc
				vcB?.cbString = "Setting B"
			}

		}

    }

}