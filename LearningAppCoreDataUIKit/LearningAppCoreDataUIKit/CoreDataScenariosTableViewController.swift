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

    
}

// MARK: - Table view data source
extension CoreDataScenariosTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataScenario.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let scenario = CoreDataScenario.scenarioFor(index: indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: scenario.cellReuseIdentifier, for: indexPath)
            cell.textLabel?.text = scenario.rawValue
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
                destination.directorViewModel = DirectorViewModel(managedContext: managedObjectContext)
            }
        } else if segue.identifier == "showDirectorsViewController" {
            if let destination = segue.destination as? DirectorViewController {
                let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
                destination.viewModel = DirectorViewModel(managedContext: managedObjectContext)
            }
        }
    }
}

#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewcontroller = storyboard.instantiateViewController(withIdentifier: "coreDataScenariosTableViewController")
    return viewcontroller
}
