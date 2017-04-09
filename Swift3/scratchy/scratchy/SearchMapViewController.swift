//
//  SearchMapViewController.swift
//  scratchy
//
//  Created by Don Mini on 4/8/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

protocol IPSearch {
	func ipZoom(iPath: IndexPath)
}

extension SearchMapViewController: IPSearch {
	func ipZoom(iPath: IndexPath){
		print("hello", iPath)
	}
}

class SearchMapViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	// MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let vc = segue.destination as? InterestPViewController {
			vc.delegate = self
		}
    }

	@IBAction func gTap(_ sender: Any) {
		print("tap")
	}
}
