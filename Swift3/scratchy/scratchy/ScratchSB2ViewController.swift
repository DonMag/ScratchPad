//
//  ScratchSB2ViewController.swift
//  scratchy
//
//  Created by Don Mini on 3/19/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ScratchSB2ViewController: UIViewController {

	@IBOutlet weak var ViewA: UILabel!
	@IBOutlet weak var ViewB: UILabel!
	@IBOutlet weak var ViewC: UILabel!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func addView(newView: UIView) -> Void {

		// if ViewC has a subview, remove it
		// if ViewB has a subview, move it to ViewC
		// if ViewA has a subview, move it to ViewB
		// add newView as a subview of ViewA
		
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
