//
//  OptionsSelectionViewController.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 24/03/24.
//

import UIKit

class OptionsSelectionViewController: UIViewController {
    
    
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
        cell.textLabel?.text = "Director"
        return cell
    }
}

extension OptionsSelectionViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
}
