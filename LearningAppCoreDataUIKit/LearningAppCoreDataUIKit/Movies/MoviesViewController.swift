//
//  MoviesViewController.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 08/03/24.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var viewModel: MoviesViewModel!
    var directorViewModel: DirectorViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchAllMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: -----------------------------------------------------------------------
// MARK: MoviesViewController Segue
extension MoviesViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentAddMovieViewController" {
            if let destination = (segue.destination as? UINavigationController)?.viewControllers.first as? AddMovieViewController {
                destination.viewModel = viewModel
                destination.directorViewModel = directorViewModel
                destination.addMovieAction = {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
        print("Unwind segue performed :: \(unwindSegue.identifier)")
    }
}

// MARK: -----------------------------------------------------------------------
// MARK: MoviesViewController UITableViewDelegate conformance
extension MoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewCell", for: indexPath)
        cell.textLabel?.text = viewModel.movies[indexPath.row].title
        return cell
    }
}

// MARK: -----------------------------------------------------------------------
// MARK: MoviesViewController UITableViewDelegate conformance
extension MoviesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
}

// MARK: -----------------------------------------------------------------------
// MARK: MoviesViewController TableViewCell Editing
extension MoviesViewController {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("Editing row :: \(indexPath.row)")
        viewModel.deleteMovie(at: indexPath)
        tableView.reloadData()
    }
}
