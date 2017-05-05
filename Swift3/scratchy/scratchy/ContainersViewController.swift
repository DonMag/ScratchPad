//
//  ContainersViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/24/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

extension String {
	
	var lastPathComponent: String {
		
		get {
			return (self as NSString).lastPathComponent
		}
	}
	var pathExtension: String {
		
		get {
			
			return (self as NSString).pathExtension
		}
	}
	var stringByDeletingLastPathComponent: String {
		
		get {
			
			return (self as NSString).deletingLastPathComponent
		}
	}
	var stringByDeletingPathExtension: String {
		
		get {
			
			return (self as NSString).deletingPathExtension
		}
	}
	var pathComponents: [String] {
		
		get {
			
			return (self as NSString).pathComponents
		}
	}
	
	func stringByAppendingPathComponent(path: String) -> String {
		
		let nsSt = self as NSString
		
		return nsSt.appendingPathComponent(path)
	}
	
	func stringByAppendingPathExtension(ext: String) -> String? {
		
		let nsSt = self as NSString
		
		return nsSt.appendingPathExtension(ext)
	}
}

class ContainersViewController: UIViewController {

	@IBOutlet weak var theSegControl: UISegmentedControl!
	@IBOutlet weak var mapContainer: UIView!
	@IBOutlet weak var tableContainer: UIView!
	
	var vcA: ContainerAViewController?
	var vcB: ContainerBViewController?
	
	weak var currentViewController: UIViewController?
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.translatesAutoresizingMaskIntoConstraints = false
		label.backgroundColor = .clear
		label.layer.masksToBounds = true
		label.numberOfLines = 0
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.textColor = .white
		return label
	}()
	
	var titleLabelText: String? {
		didSet {
			titleLabel.text = titleLabelText
			titleLabel.layoutIfNeeded()
		}
	}
	
	func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
		oldViewController.willMove(toParentViewController: nil)
		self.addChildViewController(newViewController)
		
		newViewController.view.frame = tableContainer.bounds
		
		tableContainer.addSubview(newViewController.view)
		
		newViewController.view.alpha = 0
		newViewController.view.layoutIfNeeded()
		
		UIView.animate(withDuration: 0.5, animations: {
			newViewController.view.alpha = 1.0
			oldViewController.view.alpha = 0.0
		}, completion: { finished in
			oldViewController.view.removeFromSuperview()
			oldViewController.removeFromParentViewController()
			newViewController.didMove(toParentViewController: self)
		})

	}
	
	func showContainerView(_ sender: UISegmentedControl) {
		print(sender.selectedSegmentIndex)

		if currentViewController == nil {
			currentViewController = vcA
		}
		
		if sender.selectedSegmentIndex == 0 {
			let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "componentA")
//			newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
			self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
			self.currentViewController = newViewController
		} else {
			let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "componentB")
//			newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
			self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
			self.currentViewController = newViewController
		}

	}
	
	@IBAction func showContainer(_ sender: UISegmentedControl) {
		
		print(vcA?.theLabel.text ?? "Missing A")
		print(vcB?.theLabel.text ?? "Missing B")
		
		if sender.selectedSegmentIndex == 0 {
			UIView.animate(withDuration: 0.5, animations: {
				self.tableContainer.alpha = 1
				self.mapContainer.alpha = 0
			})
			
		}else {
			UIView.animate(withDuration: 0.5, animations: {
				self.tableContainer.alpha = 0
				self.mapContainer.alpha = 1
			})
		}
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		titleLabel.text = "This is text"
		self.view.addSubview(titleLabel)
		titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
		titleLabel.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100.0 ).isActive = true

		
		let items = ["Providing Services", "Seeking Services"]
		let mySegControl = UISegmentedControl(items: items)
		
		mySegControl.addTarget(self, action: #selector(ContainersViewController.showContainerView(_:)), for: .valueChanged)

		mySegControl.selectedSegmentIndex = 0
		mySegControl.frame = theSegControl.frame
		mySegControl.frame.origin.x = 0
		view.addSubview(mySegControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func buttonTapped(_ sender: Any) {
	}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if segue.identifier == "segToA" {
			
			if let vc = segue.destination as? ContainerAViewController {
				vcA = vc
			}
			
		}
		
		if segue.identifier == "segToB" {
		
			if let vc = segue.destination as? ContainerBViewController {
				vcB = vc
				vcB?.cbString = "Setting B"
			}

		}

    }

}
