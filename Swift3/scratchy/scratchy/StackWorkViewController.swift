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
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		
		self.view.backgroundColor = UIColor.red
		
		let upgradeView: UIView = UIView()
		upgradeView.translatesAutoresizingMaskIntoConstraints = false
		
		upgradeView.backgroundColor = UIColor.blue
		
		self.view.addSubview(upgradeView)
		
		let margins = self.view.layoutMarginsGuide
		print(margins)
		upgradeView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor,
		                                 constant: 0).isActive = true
		
		upgradeView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
		upgradeView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
		
		upgradeView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
		
		upgradeView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor,
		                                    constant: 0).isActive = true
		
		self.view.sendSubview(toBack: upgradeView)
		
		self.view.setNeedsUpdateConstraints()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	
	@IBAction func testTap(_ sender: Any) {
		
		if theStackView.arrangedSubviews.count > 2 {

			// we already added the subviews
			return
			
		}

		let clrs = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.green]
		
		for i in 1...4 {
			
			let v = SampleView()
			
			v.theLabel.text = "\(i)"
			
			v.backgroundColor = clrs[i % 4]
			
			v.translatesAutoresizingMaskIntoConstraints = false
			
			theStackView.addArrangedSubview(v)
			
		}
		
	}
	
}
