//
//  PListATableViewController.swift
//  scratchy
//
//  Created by Don Mag on 3/28/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class PListATableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let anEmployee = Shared.instance.employees[1]
		
		print("Name:", anEmployee.name)
		print("Position:", anEmployee.position)
		
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Shared.instance.employees.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // TableViewCell1
		
		cell.textLabel?.text = Shared.instance.employees[indexPath.row].name
		cell.detailTextLabel?.text = Shared.instance.employees[indexPath.row].position
		
//		cell.nameLabel.text = Shared.instance.employees[indexPath.row].name
//		cell.positionLabel.text = Shared.instance.employees[indexPath.row].position
		

        // Configure the cell...

        return cell
    }

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destination = segue.destination as? PListBTableViewController, // Page2,
			let indexPath = tableView.indexPathForSelectedRow {
			destination.newPage = Shared.instance.employees[indexPath.row]
			tableView .deselectRow(at: indexPath, animated: true)
		}
	}



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
