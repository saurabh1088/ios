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
    
    @IBOutlet weak var undoLastChangesButton: UIBarButtonItem!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchAllMovies()
        directorViewModel.fetchDirectors()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerMovieTableViewCell()
        undoLastChangesButton.isHidden = true
    }
    
    @IBAction func undoLastChangesButtonAction(_ sender: Any) {
        viewModel.undoLastChange()
        viewModel.fetchAllMovies()
        tableView.reloadData()
        undoLastChangesButton.isHidden = true
    }
    
    private func registerMovieTableViewCell() {
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "movieTableViewCell")
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
        if let identifier = unwindSegue.identifier {
            print("Unwind segue performed :: \(identifier)")
        }
    }
}

// MARK: -----------------------------------------------------------------------
// MARK: MoviesViewController UITableViewDelegate conformance
extension MoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.title.text = viewModel.movies[indexPath.row].title
        cell.director.text = viewModel.movies[indexPath.row].director?.name
        cell.year.text = String(viewModel.movies[indexPath.row].yearOfRelease)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
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
        viewModel.deleteMovie(at: indexPath) {
            self.undoLastChangesButton.isHidden = false
        }
        tableView.reloadData()
    }
}
