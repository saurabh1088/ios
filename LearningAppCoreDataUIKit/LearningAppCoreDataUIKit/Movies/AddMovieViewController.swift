//
//  AddMovieViewController.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 09/03/24.
//

import UIKit

class AddMovieViewController: UIViewController {
    var viewModel: MoviesViewModel!
    var directorViewModel: DirectorViewModel!
    var addMovieAction: BasicBlock?
    
    @IBOutlet weak var movieTitleTextField: UITextField!
    @IBOutlet weak var movieLengthTextField: UITextField!
    @IBOutlet weak var movieYearOfReleaseTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add Movie"
    }
    
    @IBAction func addMovieButtonAction(_ sender: Any) {
        if let title = movieTitleTextField.text,
           let movieLength = movieLength,
           let movieYearOfRelease = movieYearOfRelease {
            viewModel.addMovie(title: title,
                               length: movieLength,
                               yearOfRelease: movieYearOfRelease)
            if let action = addMovieAction {
                action()
            }
            self.dismiss(animated: true)
        }
    }
}

extension AddMovieViewController {
    var movieLength: Int16? {
        if let length = movieLengthTextField.text {
            return Int16(length)
        }
        return nil
    }
    
    var movieYearOfRelease: Int16? {
        if let yearOfRelease = movieYearOfReleaseTextField.text {
            return Int16(yearOfRelease)
        }
        return nil
    }
}

extension AddMovieViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDirectorSelectionViewController" {
            if let destination = segue.destination as? OptionsSelectionViewController {
                var directors = [String]()
                for movie in directorViewModel.directors {
                    if let name = movie.name {
                        directors.append(name)
                    }
                }
                destination.dataSource = directors
            }
        }
    }
}
