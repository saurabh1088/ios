//
//  OptionsSelectionViewController.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 24/03/24.
//

import UIKit

typealias OptionSelectedCallback = (String) -> ()

class OptionsSelectionViewController: UIViewController {
    
    var dataSource = [String]()
    var optionSelectedCallback: OptionSelectedCallback?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension OptionsSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectableOptionTableViewCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
}

extension OptionsSelectionViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let action = optionSelectedCallback {
            action(dataSource[indexPath.row])
            self.dismiss(animated: true)
        }
    }
}
