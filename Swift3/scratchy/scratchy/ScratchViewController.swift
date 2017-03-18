//
//  ScratchViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/16/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

extension UIView
{
	func copyView<T: UIView>() -> T {
		return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
	}
}

class ScratchViewController: UIViewController {
	
	@IBOutlet weak var myHeaderView: UIView!
	
	@IBOutlet weak var tblA: UITableView!
	@IBOutlet weak var tblB: UITableView!
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let h = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 32))
		h.backgroundColor = UIColor.red
		let l = UILabel(frame: h.bounds.insetBy(dx: 8.0, dy: 8.0))
		l.text = "This is the header"
		h.addSubview(l)
		
		tblB.tableHeaderView = h
		
		let v = myHeaderView.copyView()
		
		tblA.tableHeaderView = h.copyView()
		
		
		
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
