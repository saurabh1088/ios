//
//  CountrySelectionViewModel.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 25/01/25.
//

import Foundation

protocol CountrySelectionViewModelProtocol {
    func listOfSupportedCountries() -> [String]
}

class CountrySelectionViewModel: CountrySelectionViewModelProtocol {
    func listOfSupportedCountries() -> [String] {
        return Locale.listOfCountries
    }
}
