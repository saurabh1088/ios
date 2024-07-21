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
        createRightNavigationBarButton()
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

extension DirectorViewController {
    func createRightNavigationBarButton() {
        let image = UIImage(systemName: "plus")
        let rightNavBarButton = UIBarButtonItem(image: image,
                                                style: .plain,
                                                target: self,
                                                action: #selector(openAddNewDirector))
        self.navigationItem.rightBarButtonItem = rightNavBarButton
    }
    
    @objc
    func openAddNewDirector() {
        self.performSegue(withIdentifier: "showAddDirectorViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddDirectorViewController" {
            if let destination = (segue.destination as? UINavigationController)?.viewControllers.first as? AddDirectorViewController {
                destination.viewModel = viewModel
                destination.addDirectorCallback = { _ in
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension DirectorViewController {
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
        if let identifier = unwindSegue.identifier {
            print("Unwind from :: \(identifier)")
        }
    }
}
