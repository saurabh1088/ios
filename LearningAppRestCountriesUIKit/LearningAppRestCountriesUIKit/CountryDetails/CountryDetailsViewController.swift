//
//  CountryDetailsViewController.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 27/01/25.
//

import UIKit

class CountryDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                let response = try await CountryDetailsService().fetchDetailsFor(country: "japan", with: FetchCountryDetailsRequest(countryName: "japan"))
                print(response)
            } catch(let error) {
                print("Error \(error)")
            }
            
        }
    }
}
