//
//  BetterButtonViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/2/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class BetterButtonViewController: UIViewController {
	
	@IBOutlet weak var normButton: UIButton!
	
	@IBOutlet weak var theLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func doTap(_ sender: Any) {
		let bb: BetterButton = sender as! BetterButton
		
		bb.setTitle("This is a longer title", for: UIControlState())
		
		
		let b: UIButton = self.normButton
		
//		b.setTitle("This is a longer title", for: UIControlState())
//		b.titleLabel?.font = UIFont(name: "Marker Felt", size: 60)
		
		b.titleLabel?.minimumScaleFactor = 0.10
//		b.titleLabel?.numberOfLines = 1
		b.titleLabel?.adjustsFontSizeToFitWidth = true
		b.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping

		
		theLabel.text = "This is a much, much longer label"
		theLabel.font = UIFont(name: "Marker Felt", size: 60)
		theLabel.minimumScaleFactor = 0.15
		theLabel.numberOfLines = 1
		theLabel.adjustsFontSizeToFitWidth = true
		
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
