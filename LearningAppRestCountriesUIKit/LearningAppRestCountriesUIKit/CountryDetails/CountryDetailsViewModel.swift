//
//  CountryDetailsViewModel.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 28/01/25.
//

import Foundation

protocol CountryDetailsViewModelProtocol {
    var selectedCountry: String? { get set }
    func fetchCountryDetails() async -> String?
}

class CountryDetailsViewModel: CountryDetailsViewModelProtocol {
    var selectedCountry: String?
    
    func fetchCountryDetails() async -> String? {
        do {
            if let selectedCountry = selectedCountry {
                let request = FetchCountryDetailsRequest(countryName: selectedCountry)
                let response = try await CountryDetailsService().fetchDetailsFor(country: selectedCountry, with: request)
                let jsonData = try JSONEncoder().encode(response)
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                let prettyPrintedData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
                
                if let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
                    return prettyPrintedString
                } else {
                    return "Could not convert to string"
                }
            } else {
                return "Could not convert to string"
            }
            
        } catch(let error) {
            print("Error \(error)")
            return nil
        }
    }
}
