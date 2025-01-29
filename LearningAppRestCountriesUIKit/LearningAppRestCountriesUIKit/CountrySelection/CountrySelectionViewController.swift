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
    private var selectedCellIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CountrySelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listOfSupportedCountries().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "supportedCountryTableViewCell") {
            cell.textLabel?.text = viewModel.listOfSupportedCountries()[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

extension CountrySelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellIndex = indexPath.row
        self.performSegue(withIdentifier: "showCountryDetailsViewController", sender: self)
    }
}

extension CountrySelectionViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCountryDetailsViewController",
           let viewController = segue.destination as? CountryDetailsViewController {
            viewController.viewModel.selectedCountry = viewModel.listOfSupportedCountries()[selectedCellIndex]
        }
    }
}
