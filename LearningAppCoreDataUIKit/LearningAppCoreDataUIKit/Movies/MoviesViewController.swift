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
        createRightNavigationBarButton()
    }
}

// MARK: -----------------------------------------------------------------------
// MARK: MoviesViewController Navigation Items
// TODO: Figure out if instead programmatically this can be added through storyboard itself
// Current issue is if MoviesStoryboard is again embedded in navigation controller
// then the show segue starts to get performed as present instead of push.
extension MoviesViewController {
    
    func createRightNavigationBarButton() {
        let rightBarButtonImage = UIImage(systemName: "plus")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarButtonImage,
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(rightNavigationBarButtonAction))
    }
    
    @objc
    func rightNavigationBarButtonAction() {
        let storyboard = UIStoryboard(name: "MoviesStoryboard", bundle: Bundle.main)
        let addMovieViewController = storyboard.instantiateViewController(withIdentifier: "addMovieViewController") as! AddMovieViewController
        addMovieViewController.viewModel = viewModel
        addMovieViewController.addMovieAction = {
            self.tableView.reloadData()
        }
        self.navigationController?.present(addMovieViewController, animated: true)
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
