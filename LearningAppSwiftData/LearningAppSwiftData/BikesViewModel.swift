//
//  BikesViewModel.swift
//  LearningAppSwiftData
//
//  Created by Saurabh Verma on 14/06/24.
//

import Foundation

class BikesViewModel: ObservableObject {
    @Published private var bikes = [Bike]()
    
    func add(bike: Bike) {
        bikes.append(bike)
    }
    
    func bikesInGarage() -> [Bike] {
        return bikes
    }
}
