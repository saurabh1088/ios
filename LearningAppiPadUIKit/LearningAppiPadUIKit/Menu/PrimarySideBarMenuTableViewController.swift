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
                /// If we check splitViewController's viewControllers property here, it shows it containing
                /// two instances of UINavigationController, however as per storyboard there is only one
                /// set.
                /// Observed this to be UISplitViewController's behaviour as in a isolated project with only
                /// UISplitViewController same behaviour was noticed.
                if let navigationController = self.splitViewController?.viewControllers.last as? UINavigationController,
                   let topViewcontroller = navigationController.topViewController,
                    topViewcontroller is HomeViewController {
                    print("HomeViewController already on navigation stack, not pushing again")
                } else {
                    let homeViewController = HomeViewController()
                    self.splitViewController?.showDetailViewController(homeViewController, sender: self)
                }
            }
        }
    }
}