//
//  CheckPListViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/28/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

struct EmployeeDetails {
	let functionary: String
	let imageFace: String
	let phone: String
	
	init(dictionary: [String: Any]) {
		self.functionary = (dictionary["Functionary"] as? String) ?? ""
		self.imageFace = (dictionary["ImageFace"] as? String) ?? ""
		self.phone = (dictionary["Phone"] as? String) ?? ""
	}
}
struct Employee {
	let position: String
	let name: String
	let details: [EmployeeDetails] // [String:Any]
	
	init(dictionary: [String: Any]) {
		self.position = (dictionary["Position"] as? String) ?? ""
		self.name = (dictionary["Name"] as? String) ?? ""

		let t = (dictionary["Details"] as? [Any]) ?? []
		self.details = t.map({EmployeeDetails(dictionary: $0 as! [String : Any])})
	}
}

struct Shared {
	static var instance = Shared()
	var employees: [Employee] = []
}

class CheckPListViewController: UIViewController {

	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

		if let url = Bundle.main.url(forResource: "directory", withExtension: "plist"), let array = NSArray(contentsOf: url) as? [[String:Any]] {

			Shared.instance.employees = array.map{Employee(dictionary: $0)}
			
			Shared.instance.employees.forEach({
				
				print("Name:", $0.name)
				print("Position:", $0.position)
				
				$0.details.forEach({
					
					print("Functionary:", $0.functionary)
					print("ImageFace:", $0.imageFace)
					print("Phone:", $0.phone)
					
				})
				
				// or
				//print("Functionary:", $0.details[0].functionary)
				
				print()
				
			})

		}

		
		let anEmployee = Shared.instance.employees[0]
		
		print("Name:", anEmployee.name)
		print("Position:", anEmployee.position)

		print("Detail 0 Functionary:", anEmployee.details[0].functionary)
		print("Detail 0 ImageFace:", anEmployee.details[0].imageFace)
		print("Detail 0 Phone:", anEmployee.details[0].phone)
		
		// or
		
		anEmployee.details.forEach({
			
			print("Functionary:", $0.functionary)
			print("ImageFace:", $0.imageFace)
			print("Phone:", $0.phone)
			
		})

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
