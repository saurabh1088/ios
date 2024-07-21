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
    
    @IBOutlet weak var directorSelectionButton: UIButton!
    
    @IBOutlet weak var addDirectorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add Movie"
        addDirectorButton.isHidden = !directorViewModel.directors.isEmpty
        directorSelectionButton.isHidden = directorViewModel.directors.isEmpty
    }
    
    @IBAction func addMovieButtonAction(_ sender: Any) {
        if let title = movieTitleTextField.text,
           let movieLength = movieLength,
           let movieYearOfRelease = movieYearOfRelease,
           let directorName = directorSelectionButton.titleLabel?.text {
            viewModel.addMovie(title: title,
                               length: movieLength,
                               yearOfRelease: movieYearOfRelease,
                               director: directorName)
            if let action = addMovieAction {
                action()
            }
            self.dismiss(animated: true)
        }
    }
    
    
    @IBAction func addDirectorButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DirectorStoryboard", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "addDirectorViewControllerId") as? AddDirectorViewController {
            viewController.viewModel = directorViewModel
            viewController.addDirectorCallback = { directorName in
                self.addDirectorButton.isHidden = !self.directorViewModel.directors.isEmpty
                self.directorSelectionButton.isHidden = self.directorViewModel.directors.isEmpty
                self.directorSelectionButton.setTitle(directorName, for: .normal)
            }
            self.present(viewController, animated: true)
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
            if let destination = (segue.destination as? UINavigationController)?.viewControllers.first as? OptionsSelectionViewController {
                var directors = [String]()
                directorViewModel.fetchDirectors()
                for movie in directorViewModel.directors {
                    if let name = movie.name {
                        directors.append(name)
                    }
                }
                destination.dataSource = directors
                destination.optionSelectedCallback = { selectedValue in
                    self.directorSelectionButton.setTitle(selectedValue, for: .normal)
                }
            }
        }
    }
}

extension AddMovieViewController {
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
        if let identifier = unwindSegue.identifier {
            print("Unwind from :: \(identifier)")
        }
    }
}
