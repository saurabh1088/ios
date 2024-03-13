//
//  MoviesViewController.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 08/03/24.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var viewModel: MoviesViewModel!
    
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
            if let destination = segue.destination as? AddMovieViewController {
                destination.viewModel = viewModel
                destination.addMovieAction = {
                    self.tableView.reloadData()
                }
            }
        }
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
