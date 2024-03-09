//
//  AddMovieViewController.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 09/03/24.
//

import UIKit

class AddMovieViewController: UIViewController {
    var viewModel: MoviesViewModel!
    
    @IBOutlet weak var movieTitleTextField: UITextField!
    @IBOutlet weak var movieDirectorTextField: UITextField!
    @IBOutlet weak var movieCastTextField: UITextField!
    @IBOutlet weak var movieGenreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addMovieButtonAction(_ sender: Any) {
        
    }
    
}
