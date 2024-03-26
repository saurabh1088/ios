//
//  DirectorViewController.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 25/03/24.
//

import UIKit

class DirectorViewController: UIViewController {
    
    var viewModel: DirectorViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchDirectors()
    }
}

extension DirectorViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.directors.count
    }
}

extension DirectorViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "directorTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.directors[indexPath.row].name
        return cell
    }
}
