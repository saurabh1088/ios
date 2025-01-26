//
//  FetchCountryDetailsRequest.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 26/01/25.
//

import Foundation
import SwiftNetworking

struct FetchCountryDetailsRequest: APIRequest {
    var params: [String : Any]?
    var baseURL: String { "https://restcountries.com" }
    var path: String { "/v3.1/name/\(countryName)" }
    var httpMethod: HTTPMethods { .GET }
    
    private let countryName: String

    init(countryName: String) {
        self.countryName = countryName.lowercased()
    }
}
