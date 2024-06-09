//
//  ViewController.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 07/06/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var memoryOption: CoreDataMemoryOption = .inMemory
    
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
    
    /// Instead of using a storyboard segue with method `prepare(for:sender:)` to prepare viewcontroller
    /// here viewcontroller is configured this way as `prepare(for:sender:)` gets called before `didSelectRowAt`
    /// method and hence the selection isn't available to pass on to the viewcontroller while configuring it.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableView didSelectRowAt indexPath \(indexPath)")
        memoryOption = indexPath.row == 0 ? .inMemory : .onDisk
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "bikesViewControllerStoryboardId") as? BikesViewController {
            let managedObjectContext = memoryOption.persistentContainer.viewContext
            let viewModel = BikesViewModel(managedContext: managedObjectContext, memoryOption: memoryOption)
            viewController.viewModel = viewModel
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
