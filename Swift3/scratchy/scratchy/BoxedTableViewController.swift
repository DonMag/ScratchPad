//
//  BoxedTableViewController.swift
//  verytmp
//
//  Created by Don Mag on 5/10/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class BoxedCell: UITableViewCell {
	
	var theStackView: UIStackView!
	var containingView: UIView!
	var theButton: UIButton!
	
	var brdColor = UIColor(white: 0.7, alpha: 1.0)
	
	// "spacer" view is just a 1-pt tall UIView used as a horizontal-line between labels
	//		when there is more than one title label
	func getSpacer() -> UIView {
		
		let newView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 1))
		newView.backgroundColor = brdColor
		
		newView.translatesAutoresizingMaskIntoConstraints = false
		
		newView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
		
		return newView
		
	}
	
	// "label view" is a UIView containing on UILabel
	//		embedding the label in a view allows for convenient borders and insets
	func getLabelView(text: String, position: Int) -> UIView {
		
		let v = UIView()
		v.translatesAutoresizingMaskIntoConstraints = false
		
		let newLabel = UILabel()
		newLabel.font = UIFont.systemFont(ofSize: 15.0)
		newLabel.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
		newLabel.textColor = .black
		
		newLabel.layer.borderWidth = 1
		newLabel.layer.borderColor = brdColor.cgColor
		
		newLabel.numberOfLines = 0
		newLabel.text = text
		
		newLabel.translatesAutoresizingMaskIntoConstraints = false
		
		v.addSubview(newLabel)
		
		newLabel.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 8.0).isActive = true
		newLabel.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -8.0).isActive = true
		
		var iTop: CGFloat = 0.0
		var iBot: CGFloat = 0.0
		
		// the passed "position" tells me whether this label is:
		//		a Single Title only
		//		the first Title of more than one
		//		the last Title of more than one
		//		or a Title with a Title above and below
		// so we can set up proper top/bottom padding
		
		switch position {
		case 0:
			iTop = 16.0
			iBot = 16.0
			break
			
		case 1:
			iTop = 12.0
			iBot = 8.0
			break
			
		case -1:
			iTop = 8.0
			iBot = 12.0
			break
			
		default:
			iTop = 8.0
			iBot = 8.0
			break
		}
		
		newLabel.topAnchor.constraint(equalTo: v.topAnchor, constant: iTop).isActive = true
		newLabel.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -iBot).isActive = true
		
		return v
		
	}
	
	func setupThisCell(rowNumber: Int) -> Void {

		// if containingView is nil, it hasn't been created yet
		//		so, create it + Stack view + Button
		// else
		//		don't create new ones
		// This way, we don't keep adding more and more views to the cell on reuse
		
		if containingView == nil {
			
			containingView = UIView()
			containingView.translatesAutoresizingMaskIntoConstraints = false
			
			contentView.addSubview(containingView)
			
			containingView.layer.borderWidth = 1
			containingView.layer.borderColor = brdColor.cgColor
			containingView.backgroundColor = .white
			
			containingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0).isActive = true
			containingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0).isActive = true
			
			containingView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6.0).isActive = true
			containingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6.0).isActive = true
			
			theStackView = UIStackView()
			theStackView.translatesAutoresizingMaskIntoConstraints = false
			
			containingView.addSubview(theStackView)
			
			theStackView.axis = .vertical
			theStackView.spacing = 4.0
			theStackView.alignment = .fill
			theStackView.distribution = .fill
			
			theButton = UIButton(type: .custom)
			theButton.translatesAutoresizingMaskIntoConstraints = false
			
			containingView.addSubview(theButton)
			
			theButton.backgroundColor = .blue
			theButton.setTitleColor(.white, for: .normal)
			theButton.setTitle("The Button", for: .normal)
			
			theButton.setContentHuggingPriority(1000, for: .horizontal)
			
			theButton.centerYAnchor.constraint(equalTo: containingView.centerYAnchor, constant: 0.0).isActive = true
			theButton.trailingAnchor.constraint(equalTo: containingView.trailingAnchor, constant: -8.0).isActive = true
			
			theStackView.topAnchor.constraint(equalTo: containingView.topAnchor, constant: 0.0).isActive = true
			theStackView.bottomAnchor.constraint(equalTo: containingView.bottomAnchor, constant: 0.0).isActive = true
			theStackView.leadingAnchor.constraint(equalTo: containingView.leadingAnchor, constant: 0.0).isActive = true
			
			theStackView.trailingAnchor.constraint(equalTo: theButton.leadingAnchor, constant: -8.0).isActive = true
			
		}
		
		// remove all previously added Title labels and spacer views
		
		for v in theStackView.arrangedSubviews {
			v.removeFromSuperview()
		}
		
		// setup 1 to 5 Titles
		let n = rowNumber % 5 + 1
		
		// create new Title Label views and, if needed, spacer views
		//		and add them to the Stack view
		
		if n == 1 {
			
			let aLabel = getLabelView(text: "Only one title for row: \(rowNumber)", position: 0)
			theStackView.addArrangedSubview(aLabel)
			
		} else {
			
			for i in 1..<n {
				
				let aLabel = getLabelView(text: "Title number \(i)\n for row: \(rowNumber)", position: i)
				theStackView.addArrangedSubview(aLabel)
				let aSpacer = getSpacer()
				theStackView.addArrangedSubview(aSpacer)
				
			}
			
			let aLabel = getLabelView(text: "Title number \(n)\n for row: \(rowNumber)", position: -1)
			theStackView.addArrangedSubview(aLabel)
			
		}
		
	}
	
}

class BoxedTableViewController: UITableViewController {
	
	let cellID = "boxedCell"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.register(BoxedCell.self, forCellReuseIdentifier: cellID)
		
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableViewAutomaticDimension
		
		self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
		
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1250
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BoxedCell
		
		// Configure the cell...
		
		cell.setupThisCell(rowNumber: indexPath.row)
		
		return cell
		
	}
	
}
