//
//  Country.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 26/01/25.
//

import Foundation

struct Country: Codable {
    let name: Name
    let tld: [String]
    let cca2, ccn3, cca3, cioc: String
    let independent: Bool
    let status: String
    let unMember: Bool
    let currencies: [String: Currency]
    let idd: Idd
    let capital: [String]
    let altSpellings: [String]
    let region, subregion: String
    let languages: [String: String]
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let area: Double
    let demonyms: [String: Demonym]
    let flag: String
    let maps: Maps
    let population: Int
    let gini: [String: Double]?
    let fifa: String
    let car: Car
    let timezones: [String]
    let continents: [String]
    let flags: Flags
    let coatOfArms: CoatOfArms
    let startOfWeek: String
    let capitalInfo: CapitalInfo
    let postalCode: PostalCode
}

struct Name: Codable {
    let common, official: String
    let nativeName: [String: NativeName]
}

struct NativeName: Codable {
    let official, common: String
}

struct Currency: Codable {
    let name, symbol: String
}

struct Idd: Codable {
    let root: String
    let suffixes: [String]
}

struct Translation: Codable {
    let official, common: String
}

struct Demonym: Codable {
    let f, m: String
}

struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

struct Car: Codable {
    let signs: [String]
    let side: String
}

struct Flags: Codable {
    let png, svg: String
    let alt: String
}

struct CoatOfArms: Codable {
    let png, svg: String?
}

struct CapitalInfo: Codable {
    let latlng: [Double]
}

struct PostalCode: Codable {
    let format: String
    let regex: String
}
