//
//  NavigationModel.swift
//  LearningAppNavigationSwiftUI
//
//  Created by Saurabh Verma on 25/07/24.
//

import Foundation
import SwiftUI

class NavigationModel: ObservableObject {
    @Published var navigationPath: NavigationPath
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let savingPathURL = URL.documentsDirectory.appending(path: "NavigationModel")
    
    init() {
        if let data = try? Data(contentsOf: savingPathURL),
           let decodedData = try? decoder.decode(NavigationPath.CodableRepresentation.self, from: data) {
            navigationPath = NavigationPath(decodedData)
        } else {
            navigationPath = NavigationPath()
        }
    }
    
    func savePath() {
        guard let representation = navigationPath.codable else { return }
        do {
            let data = try encoder.encode(representation)
            try data.write(to: savingPathURL)
        } catch {
            print("Error occurred while saving navigation path to documents directory")
        }
    }
}
