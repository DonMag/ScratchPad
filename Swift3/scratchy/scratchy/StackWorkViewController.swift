//
//  StackWorkViewController.swift
//  scratchy
//
//  Created by Don Mag on 2/27/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class StackWorkViewController: UIViewController {

	@IBOutlet weak var theStackView: UIStackView!
	
	let clrs = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.green]
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	
	@IBAction func testTap(_ sender: Any) {
		
		// just output the arrangedSubviews description if views have already been added
		// the new subviews SHOULD now have the correct frames, because the UI has now updated
		if theStackView.arrangedSubviews.count > 2 {

			print(theStackView.arrangedSubviews)

			return
			
		}

		// just for debugging the layouts... print the description of the views added in IB
		print(theStackView.arrangedSubviews)
		
		for i in 1...4 {
			
			guard let v = UINib(nibName: "SampleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIView else { return }
			
			guard let lbl = v.viewWithTag(99) as? UILabel else { return }
			
			lbl.text = "\(i)"
			
			v.backgroundColor = clrs[i % 4]
			
			v.translatesAutoresizingMaskIntoConstraints = false
			
			theStackView.addArrangedSubview(v)
			
		}
		
		// just for debugging the layouts... print the description of the views immediately after adding them
		// the new subviews should *not* have the correct frames, because the UI has not yet updated
		print(theStackView.arrangedSubviews)
		
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
