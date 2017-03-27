//
//  ContainerBViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/24/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ContainerBViewController: UIViewController {

	@IBOutlet weak var theLabel: UILabel!
	
	var cbString: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		if let t = cbString {
			theLabel.text = t
		}
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