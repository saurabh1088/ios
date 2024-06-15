//
//  BikesViewModel.swift
//  LearningAppSwiftData
//
//  Created by Saurabh Verma on 14/06/24.
//

import Foundation

protocol BikeViewModelProtocol {
    func add(bike: Bike)
    func bikesInGarage() -> [Bike]
}

class BikesViewModel: ObservableObject, BikeViewModelProtocol {
    @Published private var bikes = [Bike]()
    
    func add(bike: Bike) {
        bikes.append(bike)
    }
    
    func bikesInGarage() -> [Bike] {
        return bikes
    }
}
