//
//  ScratchViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/16/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ScratchViewController: UIViewController, UITextFieldDelegate {
	
	
	@IBOutlet weak var theTextField: UITextField!

	@IBOutlet weak var tfWithFont: UITextField!
	
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		
		let paraStyle: NSParagraphStyle = NSParagraphStyle()
		textField.typingAttributes = [NSForegroundColorAttributeName : UIColor.white, NSParagraphStyleAttributeName : paraStyle, NSFontAttributeName : UIFont.init(name: "HelveticaNeue-Bold", size: 16)]

	}
	
	func xtextFieldDidBeginEditing(_ textField: UITextField) {

//		let font = UIFont(name: "Marker Felt Thin", size: 16)
		
		let font = tfWithFont.font?.withSize(22)

		let paraStyle: NSParagraphStyle = NSParagraphStyle()
		
		
//		let md = (textField.typingAttributes! as NSDictionary).mutableCopy() as! NSMutableDictionary
//		let d : [String:Any] = [
//			NSForegroundColorAttributeName:
//				UIColor.red,
//			NSUnderlineStyleAttributeName:
//				NSUnderlineStyle.styleSingle.rawValue
//		]
//		md.addEntries(from:d)
//		textField.typingAttributes = md.copy() as? [String:Any]

		
		
		textField.typingAttributes =
			[NSForegroundColorAttributeName : UIColor.red,
			 NSParagraphStyleAttributeName : paraStyle,
			 NSFontAttributeName : font];

//		if let font = UIFont(name: "Raleway-SemiBold", size: 16) {
//			let paraStyle: NSParagraphStyle = NSParagraphStyle()
//			textField.attributedText = NSAttributedString(string: "", attributes: [NSForegroundColorAttributeName : UIColor.white, NSParagraphStyleAttributeName : paraStyle, NSFontAttributeName : font]);
//			// do something with attributes
//		} else {
//			// The font "Raleway-SemiBold" is not found
//		}
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
