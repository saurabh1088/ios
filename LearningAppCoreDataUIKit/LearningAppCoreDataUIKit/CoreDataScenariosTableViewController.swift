//
//  CoreDataScenariosTableViewController.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 06/03/24.
//

import UIKit

class CoreDataScenariosTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataScenarios.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "coreDataScenarioMoviesTableViewCell", for: indexPath)
            cell.textLabel?.text = CoreDataScenarios.allCases[indexPath.row].rawValue
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "coreDataScenarioDirectorTableViewCell", for: indexPath)
            cell.textLabel?.text = CoreDataScenarios.allCases[indexPath.row].rawValue
            return cell
        }
        return UITableViewCell()
    }
}

extension CoreDataScenariosTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMoviesViewController" {
            if let destination = segue.destination as? MoviesViewController {
                let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
                destination.viewModel = MoviesViewModel(managedContext: managedObjectContext)
            }
        }
    }
}
