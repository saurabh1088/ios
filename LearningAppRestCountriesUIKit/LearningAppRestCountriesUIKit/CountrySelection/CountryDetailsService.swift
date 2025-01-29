//
//  CountryDetailsService.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 26/01/25.
//

import Foundation

protocol CountryDetailsServiceProtocol {
    func fetchDetailsFor(country: String, with request: FetchCountryDetailsRequest) async throws -> [Country]?
}

class CountryDetailsService: CountryDetailsServiceProtocol {
    func fetchDetailsFor(country: String, with request: FetchCountryDetailsRequest) async throws -> [Country]? {
        try await NetworkingManager.shared.sessionManager.loadData(of: [Country].self, with: request)
    }
}
