//
//  ShadowedViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/13/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class ShadowedViewController: UIViewController {

	@IBOutlet weak var trayBottomView: UIView!
	@IBOutlet weak var trayBottomConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var thePageControl: UIPageControl!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

		// hide the "tray" view
		trayBottomView.isHidden = true
		
		thePageControl.numberOfPages = 7

    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		// constraints and frame sizes are fully calculated by AutoLayout here, so...
		
		// move the tray offscreen (below the view), and "un-hide" it
		self.trayBottomConstraint.constant = -self.trayBottomView.frame.height
		self.trayBottomView.isHidden = false

		// this first part will just put the tray view into position, below the screen
		UIView.animate(withDuration: 0.01, animations: {
			
			self.view.layoutIfNeeded()

		}, completion: { (finished: Bool) in

			// now, set the tray Bottom constraint to 0, so it will end up "sitting" on the bottom of the screen
			self.trayBottomConstraint.constant = 0

			// animate it into view - use delay to "wait a bit" before sliding the view up
			
			UIView.animate(withDuration: 0.75, delay: 0.25, options: UIViewAnimationOptions.curveEaseInOut, animations: {
				
				self.view.layoutIfNeeded()
				
			}, completion: nil)
			
		})
		
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func pgControlValueChanged(_ sender: Any) {
		if let pgc = sender as? UIPageControl {
			if pgc.currentPage % 2 == 1 {
    
				self.trayBottomConstraint.constant = -self.trayBottomView.frame.height

			} else {
			
				self.trayBottomConstraint.constant = 0
			
			}
			
			// animate it in or out of view
			
			UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
				
				self.view.layoutIfNeeded()
				
			})
			
		}
	}
	
	@IBAction func buttonTapped(_ sender: Any) {

		// if the tray Bottom Constraint is Zero, that means it is visible, so
		// set it to -(its own height) to position it offscreen, below the view
		// otherwise, it is already offscreen, so set it to Zero to bring it back up
		
		if self.trayBottomConstraint.constant == 0 {
			self.trayBottomConstraint.constant = -self.trayBottomView.frame.height
		} else {
			self.trayBottomConstraint.constant = 0
		}
		
		// animate it in or out of view
		
		UIView.animate(withDuration: 0.75, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
		
			self.view.layoutIfNeeded()
		
		})
		
	}

}
