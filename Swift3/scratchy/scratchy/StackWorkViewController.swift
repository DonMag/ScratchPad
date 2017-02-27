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
		
		if theStackView.arrangedSubviews.count > 2 {

			print(theStackView.arrangedSubviews)

			return
			
		}

		print(theStackView.arrangedSubviews)
		
		for i in 1...4 {
			
			guard let v = UINib(nibName: "SampleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIView else { return }
			
			guard let lbl = v.viewWithTag(99) as? UILabel else { return }
			
			lbl.text = "\(i)"
			
			v.backgroundColor = clrs[i % 4]
			
			v.translatesAutoresizingMaskIntoConstraints = false
			
			v.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
			v.widthAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
			
			theStackView.addArrangedSubview(v)
			
		}
		
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
