//
//  SpreadViewsViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/20/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class SpreadViewsViewController: UIViewController {

	@IBOutlet weak var theStackView: UIStackView!
	
	@IBOutlet weak var theContainerView: UIView!
	
	@IBOutlet weak var the70PctLabel: UILabel!
	
	@IBOutlet weak var theStepper: UIStepper!
	
	var numExecs: Int = 1
	
	// width of round label
	let xw: CGFloat = 32.0
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.resetExecs()
		
    }
	
	func resetExecs() -> Void {

		for v in theStackView.arrangedSubviews {
			v.removeFromSuperview()
		}
		
		for i in 1...numExecs {
			
			let v = RoundLabel()
			v.translatesAutoresizingMaskIntoConstraints = false
			v.widthAnchor.constraint(equalToConstant: xw).isActive = true
			v.heightAnchor.constraint(equalToConstant: xw).isActive = true
			
			v.text = "\(i)"
			v.backgroundColor = UIColor.cyan
			
			theStackView.addArrangedSubview(v)
			
		}
		
	}

	@IBAction func stepChanged(_ sender: Any) {
		if let stp = sender as? UIStepper {
			numExecs = Int(stp.value)
			self.resetExecs()
		}
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		let w = the70PctLabel.frame.size.width
		
		let cw:CGFloat = xw * CGFloat(numExecs)
		
		let rw:CGFloat = w - cw
		
		let sp:CGFloat = rw / CGFloat(numExecs > 1 ? numExecs - 1 : numExecs)
		
		let spacing = min(8, sp)
		
		theStackView.spacing = spacing
		
//		print("cw:", cw, "rw:", rw, "sp:", sp, "spacing:", spacing, "sv:", theStackView.spacing)
		
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
