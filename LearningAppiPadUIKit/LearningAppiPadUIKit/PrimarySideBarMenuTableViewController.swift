//
//  PrimarySideBarMenuTableViewController.swift
//  LearningAppiPadUIKit
//
//  Created by Saurabh Verma on 08/09/24.
//

import UIKit

class PrimarySideBarMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MainSideBarMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "mainSideBarMenuTableViewCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PrimaryMenuOption.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "mainSideBarMenuTableViewCell", for: indexPath) as? MainSideBarMenuTableViewCell,
           let menuOption = PrimaryMenuOption.menuOptionFor(index: indexPath) {
            cell.menuImageView.image = UIImage(systemName: menuOption.icon)
            cell.menuTitle.text = menuOption.printValue
            return cell
        }
        return UITableViewCell()
    }
    
    // TODO: Revisit this and check best way to show this.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let option = PrimaryMenuOption.menuOptionFor(index: indexPath) {
            if option == .home {
                let homeViewController = HomeViewController()
                self.splitViewController?.showDetailViewController(homeViewController, sender: self)
            }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
