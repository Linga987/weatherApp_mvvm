//
//  CityViewModel.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 17/05/24.
//

import Foundation

class CityViewModel {
    var cities: [City] = []
    
    init() {
        
        let cityNames = ["New York", "London", "Brazil", "Paris", "Tokyo","Bengaluru"]
        cities = cityNames.map { City(name: $0, isFavourite: false) }
    }
    
    func numberOfSection() -> Int {
        return cities.count
    }
    
    func numberOfRows() -> Int {
        return cities.count
    }
}
