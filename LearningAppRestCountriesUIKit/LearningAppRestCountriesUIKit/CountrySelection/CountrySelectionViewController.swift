//
//  CountrySelectionViewController.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 25/01/25.
//

import UIKit

class CountrySelectionViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CountrySelectionViewModelProtocol = CountrySelectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
