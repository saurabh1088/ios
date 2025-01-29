//
//  Locale+Extension.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 25/01/25.
//

import Foundation

extension Locale {
    /// Returns an alphabetically sorted list of country names based on the current locale settings.
    static var listOfCountries: [String] {
        var countrySet = Set<String>()
        let locales = Locale.availableIdentifiers
        for localeID in locales {
            let locale = Locale(identifier: localeID)
            if let countryCode = locale.region?.identifier {
                let countryName = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) ?? countryCode
                countrySet.insert(countryName)
            }
        }
        
        // Convert the set to an array and sort it
        return Array(countrySet).sorted()
    }
}
