//
//  CountryDetailsViewController.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 27/01/25.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var viewModel: CountryDetailsViewModelProtocol = CountryDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            let response = await viewModel.fetchCountryDetails()
            textView.text = response
        }
    }
}
