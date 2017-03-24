//
//  AttribRoundedLabelViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/23/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class AttribRoundedLabelViewController: UIViewController {

	@IBOutlet weak var myLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		
		
		let myAttributedString = NSMutableAttributedString(string:"hello")
		myAttributedString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.red, range: NSRange(location: 0, length: myAttributedString.length))
		myLabel.attributedText = myAttributedString
		myLabel.layer.cornerRadius = 5
		myLabel.clipsToBounds = true
		myLabel.layer.masksToBounds = true
		
		let b = UIButton()
		b.isSelected = true
		
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
