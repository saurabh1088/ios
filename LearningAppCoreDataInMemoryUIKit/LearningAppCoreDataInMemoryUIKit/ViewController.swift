//
//  ViewController.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 07/06/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.title = "Storage Option"
    }
}

// MARK: Extenstion ViewController UITableViewDataSource
extension ViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CoreDataMemoryOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let option = CoreDataMemoryOption.memoryOptionFor(index: indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: option.cellReUseIdentifier, for: indexPath)
            cell.textLabel?.text = option.rawValue
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: Extension ViewController UITableViewDelegate
extension ViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView didSelectRowAt indexPath \(indexPath)")
    }
}

extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBikesViewController" {
            if let viewController = segue.destination as? BikesViewController {
                let managedObjectContext = CoreDataManager.shared.persistentContainer.viewContext
                viewController.viewModel = BikesViewModel(managedContext: managedObjectContext)
            }
        }
    }
}
