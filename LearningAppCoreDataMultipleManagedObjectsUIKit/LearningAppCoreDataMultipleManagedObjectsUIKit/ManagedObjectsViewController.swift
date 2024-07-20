//
//  ManagedObjectsViewController.swift
//  LearningAppCoreDataMultipleManagedObjectsUIKit
//
//  Created by Saurabh Verma on 14/07/24.
//

import UIKit

class ManagedObjectsViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension ManagedObjectsViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MainModel.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let modelType = MainModel.modelTypeFor(index: indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: modelType.cellReUseIdentifier, for: indexPath)
            cell.textLabel?.text = modelType.rawValue
            return cell
        }
        return UITableViewCell()
    }
}

extension ManagedObjectsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case MainModel.bike.storyBoardSegue:
            let destination = segue.destination as? BikesViewController
            destination?.viewModel = BikesViewModel()
        case MainModel.company.storyBoardSegue:
            let destination = segue.destination as? CompaniesViewController
            destination?.viewModel = CompaniesViewModel()
        case MainModel.ridingGear.storyBoardSegue:
            let destination = segue.destination as? RidingGearViewController
            destination?.viewModel = RidingGearViewModel()
        default:
            print("Not a valid segue identifier")
        }
    }
}
