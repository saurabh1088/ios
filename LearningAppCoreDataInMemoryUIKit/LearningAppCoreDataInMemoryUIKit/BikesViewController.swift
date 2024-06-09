//
//  BikesViewController.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 08/06/24.
//

import UIKit

class BikesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: BikesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.fetchAllBikes()
    }
}

// MARK: Extension BikesViewController UITableViewDataSource
extension BikesViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.bikes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bikeDetailsTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.bikes[indexPath.row].name
        return cell
    }
}

// MARK: Extension BikesViewController UITableViewDelegate
extension BikesViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView didSelectRowAt indexPath")
    }
}

extension BikesViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddNewBikeViewController" {
            if let viewController = (segue.destination as? UINavigationController)?.viewControllers.first as? AddNewBikeViewController {
                viewController.viewModel = viewModel
            }
        }
    }
}
