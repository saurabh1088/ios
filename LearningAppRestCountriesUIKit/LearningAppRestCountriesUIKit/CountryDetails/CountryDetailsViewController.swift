//
//  CountryDetailsViewController.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 27/01/25.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                let response = try await CountryDetailsService().fetchDetailsFor(country: "japan", with: FetchCountryDetailsRequest(countryName: "japan"))
                
                let jsonData = try JSONEncoder().encode(response)
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                let prettyPrintedData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
                
                if let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8) {
                    textView.text = prettyPrintedString
                } else {
                    textView.text = "Could not convert to string"
                }
            } catch(let error) {
                print("Error \(error)")
            }
            
        }
    }
}
